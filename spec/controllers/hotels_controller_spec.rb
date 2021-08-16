require 'rails_helper'

RSpec.describe HotelsController, type: :controller do

  describe "GET #show" do
    before do
      @user = FactoryBot.create(:user_jason)
    end

    it "returns http success" do
      sign_in @user
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
