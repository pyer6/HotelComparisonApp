class RemoveNearestStationFromHotels < ActiveRecord::Migration[6.0]
  def change
    remove_column :hotels, :nearest_station, :string
  end
end
