class RemoveReviewFromStation < ActiveRecord::Migration[7.1]
  def change
    remove_reference :stations, :review, null: false, foreign_key: true
  end
end
