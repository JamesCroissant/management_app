FactoryBot.define do
  factory :schedule do
    title             { 'ララポ' }
    content           { '買い物' }
    start_time        { Time.now + 60 * 60 }       # 現在時刻の1時間後
    end_time          { Time.now + 600 * 60 }       # 現在時刻の10時間後

    association :user
    association :car
  end
end
