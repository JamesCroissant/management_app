class CarsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  
  def car_params
    params.require(:car).permit(:car_name, :car_number, :car_model).merge(user_id: current_user.id)
  end

end
