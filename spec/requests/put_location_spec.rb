require 'rails_helper'

describe 'put a location route', :type => :request do
  before { @location = FactoryBot.create(:location) }

  it "returns a success response" do
    put "/api/v1/locations/#{@location.id}", params: { galaxy: "Test Galaxy"}, headers: {Authorization: ENV['DROID_SHOP_API_KEY']}
    expect(response).to have_http_status(200)
  end
end
