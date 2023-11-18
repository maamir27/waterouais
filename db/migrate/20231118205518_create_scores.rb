class CreateScores < ActiveRecord::Migration[7.1]
  def change
    create_table :scores do |t|
      t.integer :check_in
      t.integer :stations_created
      t.integer :reviews_submitted
      t.integer :photos_added
      t.integer :total_score
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
