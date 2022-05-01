class SchedulesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to schedule_path
    else
      render :edit
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:title, :start_time, :end_time, :content).merge(user_id: current_user.id)
  end

end
