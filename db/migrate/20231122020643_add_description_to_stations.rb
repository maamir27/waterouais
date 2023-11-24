class AddDescriptionToStations < ActiveRecord::Migration[7.1]
  def change
    add_column :stations, :description, :string
  end
end
