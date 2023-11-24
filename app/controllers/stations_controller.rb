class StationsController < ApplicationController
  def index
    @stations = Station.all
    @markers = @stations.geocoded.map do |s|
      {
        lat: s.latitude,
        lng: s.longitude
      }
    end
  end

  def new
    @station = Station.new
  end

  def show
    @station = Station.find(params[:id])
  end

  def create
    @station = Station.new(station_params)
    @station.user = current_user
    if @station.save
      redirect_to station_path(@station)
      current_user.score.increment!(:stations_created, 5)
      current_user.calculate_total_score
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def station_params
    params.require(:station).permit(:name, :address, :description, photos: [])
  end
end
