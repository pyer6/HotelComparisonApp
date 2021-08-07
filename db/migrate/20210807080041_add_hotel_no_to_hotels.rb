class AddHotelNoToHotels < ActiveRecord::Migration[6.0]
  def change
    add_column :hotels, :hotel_no, :integer, null: false
  end
end
