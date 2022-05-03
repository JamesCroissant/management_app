class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @schedules = current_user.schedules
  end
end
