class AddColumnsToStation < ActiveRecord::Migration[7.1]
  def change
    add_column :stations, :name, :string
    add_column :stations, :intersection, :string
    add_column :stations, :latitude, :float
    add_column :stations, :longitude, :float
    add_column :stations, :avg_rating, :integer
    add_column :stations, :last_updated, :timestamp
    add_column :stations, :status, :boolean
  end
end
