class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :title, presence: true
  validate :start_check
  validate :start_end_check
  validate :car_valid_check
     
  validates :content, presence: true

  def start_check
    errors.add(:start_time, "は現在の日時より遅い時間を選択してください") if self.start_time < Time.now
  end

  def start_end_check
    errors.add(:end_time, "は開始時刻より遅い時間を選択してください") if self.start_time > self.end_time
  end

  def car_valid_check
    # スケジュール内に存在するcar_idを取得し、そのcar_idと新しく登録されるcar_idが等しければエラー
    schedule_valid = Schedule.where('end_time > ? and ? > start_time', self.start_time, self.end_time)   # OK
    if schedule_valid.present?
      car_valids = schedule_valid.group(:car_id).having('count(*) >= 1').pluck(:car_id)
      car_valids.each do |car_valid|
        if self.car_id == car_valid then                                   # ここだけ！！！！！！！！！！！！！！！！！
          errors.add(:car_id, '同じ時間に同じ車は使用できません')
        end
      end
    end
  end

end

