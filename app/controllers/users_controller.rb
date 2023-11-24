class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @score = @user.score
  end
end
