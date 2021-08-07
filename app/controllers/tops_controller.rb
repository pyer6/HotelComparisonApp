class TopsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  require 'will_paginate/array'

  def index
    @keyword = params[:keyword]
    @hotels = search_hotel.paginate(page: params[:page], per_page: 10)
  end

  private

    def search_hotel
      http_client = HTTPClient.new
      url = "https://app.rakuten.co.jp/services/api/Travel/KeywordHotelSearch/20170426"
      query = {
        "applicationId" => ENV["RAKUTEN_APPID"],
        "formatVersion" => 2,
        "keyword" => params[:keyword],
        "responseType" => "small",
      }
      response = http_client.get(url, query)
      response = JSON.parse(response.body)
  
      hotels = []
      if response["hotels"]
        response["hotels"].each do |hotel|
          hotels << {
            hotel_no: hotel[0]["hotelBasicInfo"]["hotelNo"],
            name: hotel[0]["hotelBasicInfo"]["hotelName"],
            information_url: hotel[0]["hotelBasicInfo"]["hotelInformationUrl"],
            plan_list_url: hotel[0]["hotelBasicInfo"]["planListUrl"],
            review_count: hotel[0]["hotelBasicInfo"]["reviewCount"],
            review_average: hotel[0]["hotelBasicInfo"]["reviewAverage"],
            review_url: hotel[0]["hotelBasicInfo"]["reviewUrl"],
            postal_code: hotel[0]["hotelBasicInfo"]["postalCode"],
            address1: hotel[0]["hotelBasicInfo"]["address1"],
            address2: hotel[0]["hotelBasicInfo"]["address2"],
            telephone_no: hotel[0]["hotelBasicInfo"]["telephoneNo"],
            nearest_station: hotel[0]["hotelBasicInfo"]["nearestStation"],
            parking_information: hotel[0]["hotelBasicInfo"]["parkingInformation"],
            access: hotel[0]["hotelBasicInfo"]["access"].gsub(/　/," "),
            hotel_image_url: hotel[0]["hotelBasicInfo"]["hotelImageUrl"],
          }
        end
      end
      hotels
    end
end