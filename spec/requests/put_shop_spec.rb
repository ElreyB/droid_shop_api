require 'rails_helper'

describe 'put a shop route', :type => :request do

  before do
    @location = FactoryBot.create(:location)
    @shop = FactoryBot.create(:shop, location: @location)
  end

  it "returns a success response" do
    user_name = @shop.owner
    put "/api/v1/locations/#{@location.id}/shops/#{@shop.id}", params: {:motto => "New Motto", :owner => user_name}, headers: {Authorization: ENV['DROID_SHOP_API_KEY']}
    expect(response).to have_http_status(200)
  end

end
