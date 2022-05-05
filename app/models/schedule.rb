class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :title, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :content, presence: true
end
