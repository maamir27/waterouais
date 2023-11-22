class StationsController < ApplicationController
  private

  def station_params
    params.require(:station).permit(photos: [])
  end
end
