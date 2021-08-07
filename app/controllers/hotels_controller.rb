class HotelsController < ApplicationController
  def show
    @hotels = current_user.hotels
  end

  def create
    @hotel = current_user.hotels.build(hotel_params)
    @hotel_no= @hotel.hotel_no
    @hotel.save
  end

  def destroy
    @hotel = Hotel.find_by(id: params[:id])
    @hotel_no= @hotel.hotel_no
    @hotel.destroy
  end

  private

    def hotel_params
      params.require(:hotel).permit(:name, :information_url, :plan_list_url, :review_count, :review_average, :review_url, :postal_code, :address1, :address2, :telephone_no, :nearest_station, :parking_information, :access, :hotel_image_url, :hotel_no)
    end
end

# {:hotel_no=>179326, :name=>"ホテルトレンド福山駅前（２０２０年１０月１９日オープン）", :information_url=>"https://img.travel.rakuten.co.jp/image/tr/api/kw/JBe8h/?f_no=179326", :plan_list_url=>"https://img.travel.rakuten.co.jp/image/tr/api/kw/3VTwt/?f_no=179326&f_flg=PLAN", :review_count=>36, :review_average=>4.14, :review_url=>"https://img.travel.rakuten.co.jp/image/tr/api/kw/HTX0u/?f_hotel_no=179326", :postal_code=>"720-0063", :address1=>"広島県", :address2=>"福山市元町12番14号", :telephone_no=>"084-922-7077", :nearest_station=>"福山", :parking_information=>"当館に駐車場はございません。お客様ご負担にて近隣の駐車場へお駐め頂いております。予めご了承下さい", :access=>"JR山陽本線・山陽新幹線・福塩線 福山駅より徒歩約3分", :hotel_image_url=>"https://img.travel.rakuten.co.jp/share/HOTEL/179326/179326.jpg"

# {"hotel"=>{"access"=>"JR山陽本線・山陽新幹線・福塩線 福山駅より徒歩約3分", "address1"=>"広島県", "address2"=>"福山市元町12番14号", "hotel_image_url"=>"https://img.travel.rakuten.co.jp/share/HOTEL/179326/179326.jpg", "hotel_no"=>"179326", "information_url"=>"https://img.travel.rakuten.co.jp/image/tr/api/kw/JBe8h/?f_no=179326", "name"=>"ホテルトレンド福山駅前（２０２０年１０月１９日オープン）", "nearest_station"=>"福山", "parking_information"=>"当館に駐車場はございません。お客様ご負担にて近隣の駐車場へお駐め頂いております。予めご了承下さい", "plan_list_url"=>"https://img.travel.rakuten.co.jp/image/tr/api/kw/3VTwt/?f_no=179326&f_flg=PLAN", "postal_code"=>"720-0063", "review_average"=>"4.14", "review_count"=>"36", "review_url"=>"https://img.travel.rakuten.co.jp/image/tr/api/kw/HTX0u/?f_hotel_no=179326", "telephone_no"=>"084-922-7077"}, "controller"=>"hotels", "action"=>"create"} permitted: false>

# {"access"=>"JR山陽本線・山陽新幹線・福塩線 福山駅より徒歩約3分", "address1"=>"広島県", "address2"=>"福山市元町12番14号", "hotel_image_url"=>"https://img.travel.rakuten.co.jp/share/HOTEL/179326/179326.jpg", "hotel_no"=>"179326", "information_url"=>"https://img.travel.rakuten.co.jp/image/tr/api/kw/JBe8h/?f_no=179326", "name"=>"ホテルトレンド福山駅前（２０２０年１０月１９日オープン）", "nearest_station"=>"福山", "parking_information"=>"当館に駐車場はございません。お客様ご負担にて近隣の駐車場へお駐め頂いております。予めご了承下さい", "plan_list_url"=>"https://img.travel.rakuten.co.jp/image/tr/api/kw/3VTwt/?f_no=179326&f_flg=PLAN", "postal_code"=>"720-0063", "review_average"=>"4.14", "review_count"=>"36", "review_url"=>"https://img.travel.rakuten.co.jp/image/tr/api/kw/HTX0u/?f_hotel_no=179326", "telephone_no"=>"084-922-7077"} permitted: false>