class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @stations = Station.all
    @markers = @stations.geocoded.map do |s|
      {
        lat: s.latitude,
        lng: s.longitude,
        info_window_html: render_to_string(partial: "stations/info_window", locals: { station: s })
      }
    end
  end

  def leaderboard
    @leaderboard_users = User.select('users.*, scores.total_score, ROW_NUMBER() OVER (ORDER BY scores.total_score DESC)')
    .joins(:score)
    .limit(10)
  end
end
