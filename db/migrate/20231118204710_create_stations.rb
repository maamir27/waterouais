class CreateStations < ActiveRecord::Migration[7.1]
  def change
    create_table :stations do |t|
      t.timestamps
    end
  end
end
