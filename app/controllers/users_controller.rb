class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show

  def show
    @nickname = current_user.nickname
    @schedules = current_user.schedules.order(start_time: :asc)
  end
end
