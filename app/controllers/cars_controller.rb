class CarsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_car, only: [:edit, :update, :show, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]

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

  def show
  end

  def edit
  end

  def update
    if @car.update(car_params)
      redirect_to car_path
    else
      render :edit
    end
  end

  def destroy
    @car.destroy
    redirect_to root_path
  end

  private

  def car_params
    params.require(:car).permit(:car_name, :car_number, :car_model).merge(user_id: current_user.id)
  end

  def set_car
    @car = Car.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless @car.user_id == current_user.id
  end
end
