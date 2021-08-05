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
            ホテル名: hotel[0]["hotelBasicInfo"]["hotelName"],
            施設情報ページ: hotel[0]["hotelBasicInfo"]["hotelInformationUrl"],
            宿泊プラン一覧ページ: hotel[0]["hotelBasicInfo"]["planListUrl"],
            レビュー数: hotel[0]["hotelBasicInfo"]["reviewCount"],
            総合評価: hotel[0]["hotelBasicInfo"]["reviewAverage"],
            お客様の声ページ: hotel[0]["hotelBasicInfo"]["reviewUrl"],
            郵便番号: hotel[0]["hotelBasicInfo"]["postalCode"],
            住所1: hotel[0]["hotelBasicInfo"]["address1"],
            住所2: hotel[0]["hotelBasicInfo"]["address2"],
            電話番号: hotel[0]["hotelBasicInfo"]["telephoneNo"],
            最寄駅: hotel[0]["hotelBasicInfo"]["nearestStation"],
            駐車場の有無: hotel[0]["hotelBasicInfo"]["parkingInformation"],
            アクセス方法: hotel[0]["hotelBasicInfo"]["access"].gsub(/　/," ").gsub(" ",""),
          }
        end
      end
      hotels
    end
end