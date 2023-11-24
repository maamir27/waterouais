class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def leaderboard
    @leaderboard_users = User.includes(:score)
    .order('scores.total_score DESC')
    .limit(10)
  end
end
