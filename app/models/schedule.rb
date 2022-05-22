class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :car

  with_options presence: true do
    validates :title
    validates :content
  end

  validate :start_check
  validate :start_end_check
  validate :car_valid_check

  def start_check
    self.errors.add(:start_time, "は現在の時間以降を選択してください") if self.start_time < Time.now
  end

  def start_end_check
    self.errors.add(:end_time, "は開始時刻より遅い時間を選択してください") if self.start_time > self.end_time
  end

  def car_valid_check
    overlapped_schedules = Schedule
      .where(car_id: self.car_id)
      .where("end_time > ?", self.start_time)
      .where("start_time < ?", self.end_time)

    if overlapped_schedules.present?
      self.errors.add(:car_id, "はこの時間に使用できません")
    end
  end

end



