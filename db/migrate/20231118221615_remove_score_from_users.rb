class RemoveScoreFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_reference :users, :score, null: false, foreign_key: true
  end
end
