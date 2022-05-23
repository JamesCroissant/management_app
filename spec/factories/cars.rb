FactoryBot.define do
  factory :car do
    car_name          { 'スバル' }
    car_number        { 1111 }
    car_model         { 'XV' }
    association :user
  end
end

