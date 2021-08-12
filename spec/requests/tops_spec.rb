require 'rails_helper'

RSpec.describe "Tops", type: :request do
  describe "GET /tops" do
    it "ルート画面を表示" do
      get "/"
      expect(response.status).to eq(200)
    end
  end
end
