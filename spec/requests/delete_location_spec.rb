require 'rails_helper'

describe "post a location", :type => :request do

  before do
    post '/api/v1/locations', params: { galaxy: "Test Galaxy", planet: "Test Planet"}, headers: {Authorization: ENV['DROID_SHOP_API_KEY']}
  end

  it "returns success response" do
    id = JSON.parse(response.body)['id']
    delete '/api/v1/locations/id', headers: {Authorization: ENV['DROID_SHOP_API_KEY']}
    expect(response).to have_http_status(404)
  end
end
