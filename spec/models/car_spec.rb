require 'rails_helper'

RSpec.describe Car, type: :model do
  before do
    @car = FactoryBot.build(:car)
  end

  describe '車の新規登録' do
    context '新規登録できるとき' do
      it '全てが存在すれば登録できる' do
        expect(@car).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'car_nameが空では登録できない' do
        @car.car_name = ''
        @car.valid?
        expect(@car.errors.full_messages).to include("Car name can't be blank")
      end
      it 'car_numberが空では登録できない' do
        @car.car_number = ''
        @car.valid?
        expect(@car.errors.full_messages).to include("Car number can't be blank")
      end
      it 'car_numberが数字でしか登録できない' do
        @car.car_number = 'aaaa'
        @car.valid?
        expect(@car.errors.full_messages).to include('Car number is invalid. Input only number')
      end
      it 'car_modelが空では登録できない' do
        @car.car_model = ''
        @car.valid?
        expect(@car.errors.full_messages).to include("Car model can't be blank")
      end
      it 'ユーザーが紐づいていなければ登録できない' do
        @car.user = nil
        @car.valid?
        expect(@car.errors.full_messages).to include('User must exist')
      end
    end
  end
end
