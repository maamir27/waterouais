class StationsAvgRatingChangeColumnType < ActiveRecord::Migration[7.1]
  def change
    change_column(:stations, :avg_rating, :decimal, precision: 5, scale: 2)
  end
end
