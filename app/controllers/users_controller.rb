class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @user = User.find(params[:id])
    @user_rank = User.joins(:score).where('scores.total_score > ?', @user.score.total_score).count + 1
    @reviews_submitted = @user.reviews
    @created_stations = @user.stations

    @created_stations.each do |station|
      average_score_array = []
      station.reviews.each do |review|
        average_score_array << review.rating
      end
      station.avg_rating = average_score_array.sum.to_f / average_score_array.length
    end

    Rails.logger.debug "Reviews Submitted: #{@reviews_submitted}"
    Rails.logger.debug "Created Stations: #{@created_stations}"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
