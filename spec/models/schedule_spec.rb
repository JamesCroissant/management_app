require 'rails_helper'

RSpec.describe Schedule, type: :model do
  before do
    @schedule = FactoryBot.build(:schedule)            # build：メモリに一時的にインスタンスを生成する、DBにアクセスする必要がない処理に対応
  end

  describe 'スケジュールの新規登録' do
    context '新規登録できるとき' do
      it '全てが存在すれば登録できる' do
        expect(@schedule).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'titleが空では登録できない' do
        @schedule.title = ''
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Title can't be blank")
      end
      it 'contentが空では登録できない' do
        @schedule.content = ''
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Content can't be blank")
      end
      it 'start_timeが現在時刻より前の時間だと登録できない' do
        @schedule.start_time = Time.now - 60 * 60
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Start time は現在の時間以降を選択してください")
      end
      it 'end_timeが開始時刻より前の時間だと登録できない' do
        @schedule.end_time = Time.now
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("End time は開始時刻より遅い時間を選択してください")
      end
      it 'スケジュールの時間が被っていて、かつ、同じ種類の車を利用する際は登録できない' do
        car = FactoryBot.create(:car)                    # create：DBにインスタンスを保存する、DBにアクセスする必要がある処理に対応
        another_car = FactoryBot.create(:car)
        schedule = FactoryBot.create(:schedule, car_id: car.id)
        another_schedule = FactoryBot.create(:schedule, car_id: another_car.id)
        another_schedule.start_time = Time.now + 30 * 60
        another_schedule.end_time = Time.now + 240 * 60
        @schedule.car_id == another_schedule.car_id
        another_schedule.valid?
        expect(another_schedule.errors.full_messages).to include("Car はこの時間に使用できません")
      end
      it 'ユーザーが紐づいていなければ登録できない' do
        @schedule.user = nil
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("User must exist")
      end
      it '車が紐づいていなければ登録できない' do
        @schedule.car = nil
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Car must exist")
      end
    end
  end
end