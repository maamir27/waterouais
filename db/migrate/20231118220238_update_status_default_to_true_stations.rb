class UpdateStatusDefaultToTrueStations < ActiveRecord::Migration[7.1]
  def change
    change_column_default :stations, :status, from: nil, to: true
  end
end
