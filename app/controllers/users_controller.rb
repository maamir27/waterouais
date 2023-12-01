class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @user = User.find(params[:id])
    @user_rank = User.joins(:score)
      .where('scores.total_score > ?', @user.score.total_score)
      .count + 1
    @reviews_submitted = @user.reviews
    @created_stations = @user.stations


  Rails.logger.debug "Reviews Submitted: #{@reviews_submitted}"
  Rails.logger.debug "Created Stations: #{@created_stations}"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
