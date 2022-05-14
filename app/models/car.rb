class Car < ApplicationRecord
  belongs_to :user
  has_one :schedule

  validates :car_name, presence: true
  validates :car_number, presence: true
  validates :car_model, presence: true
end
