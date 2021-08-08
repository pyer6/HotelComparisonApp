class AddHotelMinChargeToHotels < ActiveRecord::Migration[6.0]
  def change
    add_column :hotels, :hotel_min_charge, :integer
  end
end
