class Car < ApplicationRecord
  belongs_to :user
  has_one :schedule

  with_options presence: true do
    validates :car_name
    validates :car_number
    validates :car_model
  end

  validates :car_number, numericality: { only_integer: true, message: 'is invalid. Input only number' }, allow_blank: true
end
