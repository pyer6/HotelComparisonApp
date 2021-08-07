class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false, default: ""
      t.text :information_url
      t.text :plan_list_url
      t.integer :review_count
      t.float :review_average
      t.text :review_url
      t.string :postal_code
      t.string :address1
      t.string :address2
      t.string :telephone_no
      t.string :nearest_station
      t.string :parking_information
      t.string :access
      t.text :hotel_image_url

      t.timestamps
    end
  end
end
