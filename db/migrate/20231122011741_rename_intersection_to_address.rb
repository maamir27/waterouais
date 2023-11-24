class RenameIntersectionToAddress < ActiveRecord::Migration[7.1]
  def change
    rename_column :stations, :intersection, :address
  end
end
