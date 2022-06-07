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
    errors.add(:start_time, 'は現在の時間以降を選択してください') if start_time < Time.now
  end

  def start_end_check
    errors.add(:end_time, 'は開始時刻より遅い時間を選択してください') if start_time > end_time
  end

  def car_valid_check
    overlapped_schedules = Schedule
                           .where(car_id: car_id)
                           .where('end_time > ?', start_time)
                           .where('start_time < ?', end_time)
                           .where.not(id: id)                      # 過去に登録したscheduleで引っかからないようにする

    errors.add(:car_id, 'はこの時間に使用できません') if overlapped_schedules.present?
  end
end
