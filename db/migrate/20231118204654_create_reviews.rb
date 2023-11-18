class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.string :date
      t.integer :rating
      t.string :description

      t.timestamps
    end
  end
end
