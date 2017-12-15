require 'rails_helper'

describe "delete a shop route" do

  before do
    @location = FactoryBot.create(:location)
    @shop = FactoryBot.create(:shop, location: @location)
  end

  it "returns a success code" do
    user_name = @shop.owner
    delete "/api/v1/locations/#{@location.id}/shops/#{@shop.id}", params: {:owner => user_name}, headers: {Authorization: ENV['DROID_SHOP_API_KEY']}
    expect(response).to have_http_status(200)

  end

end
