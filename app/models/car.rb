class Car < ApplicationRecord
  belongs_to :user
  has_one :schedule
end
