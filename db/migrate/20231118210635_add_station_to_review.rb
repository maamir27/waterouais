class AddStationToReview < ActiveRecord::Migration[7.1]
  def change
    add_reference :reviews, :station, null: false, foreign_key: true
  end
end
