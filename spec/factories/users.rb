FactoryBot.define do
  factory :user do
    nickname                 { Faker::Name.initials }
    email                    { Faker::Internet.free_email }
    password                 { 'aaa000' }
    password_confirmation    { password }
    family_name              { '山田' }
    first_name               { '太郎' }
    birthday                 { Date.new(1989, 1, 1) }
    occupation               { '学生' }
    phone_number             { '09012345678' }
  end
end
