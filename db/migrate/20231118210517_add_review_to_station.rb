class AddReviewToStation < ActiveRecord::Migration[7.1]
  def change
    add_reference :stations, :review, null: false, foreign_key: true
  end
end
