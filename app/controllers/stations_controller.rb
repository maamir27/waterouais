class StationsController < ApplicationController
  def index
    @stations = Station.geocoded
    @markers = @stations.map do |s|
      {
        lat: s.latitude,
        lng: s.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { station: s }),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def new
    @station = Station.new
  end

  def show
    @station = Station.find(params[:id])
    average_score_array = []
    @station.reviews.each do |review|
      average_score_array << review.rating
    end
    @station.avg_rating = average_score_array.sum.to_f / average_score_array.length
  end

  def create
    @station = Station.new(station_params)
    @station.user = current_user
    if @station.save
      current_user.score.increment!(:stations_created, 5)
      current_user.score.calculate_total_score
      redirect_to station_path(@station)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def check_in
    @station = Station.find(params[:id])
    if current_user
      session[:checked_in_stations] ||= []
      unless session[:checked_in_stations].include?(@station.id)
        current_user.score.increment!(:check_in, 1)
        current_user.score.calculate_total_score
        session[:checked_in_stations] << @station.id
      end
        head :ok
      else
        head :unauthorized
    end
  end

  private

  def station_params
    params.require(:station).permit(:name, :address, :description, photos: [])
  end
end
