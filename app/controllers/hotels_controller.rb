class HotelsController < ApplicationController
  before_action :authenticate_user!

  def index
    @hotels = current_user.hotels.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
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
      params.require(:hotel).permit(:name, :information_url, :plan_list_url, :review_count, :review_average, :review_url, :postal_code, :address1, :address2, :telephone_no, :parking_information, :access, :hotel_image_url, :hotel_no, :hotel_min_charge)
    end
end