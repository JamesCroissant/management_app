class SchedulesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_schedule, only: [:edit, :update, :show, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]

  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
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
    if @schedule.update(schedule_params)
      redirect_to schedule_path
    else
      render :edit
    end
  end

  def destroy
    @schedule.destroy
    redirect_to root_path
  end

  private

  def schedule_params
    params.require(:schedule).permit(:title, :start_time, :end_time, :car_id, :content).merge(user_id: current_user.id)
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless @schedule.user_id == current_user.id
  end

end
