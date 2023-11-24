class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @station = Station.find(params["station_id"].to_i)
  end

  def create
    @review = Review.new
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to station_path, notice: "Review deleted successfully"
  end
end
