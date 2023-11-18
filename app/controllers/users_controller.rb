class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @stations = @user.stations
    @score = @user.score
  end
end
