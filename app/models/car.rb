class Car < ApplicationRecord
  belongs_to :user
  has_one :schedule

  validates :car_name, presence: true
  validates :car_number, numericality: { only_integer: true, message: 'is invalid. Input only number' },
                         length: { is: 4 }, allow_blank: true
  validates :car_model, presence: true
end
