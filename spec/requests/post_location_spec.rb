require 'rails_helper'

describe "post a location", :type => :request do

  before do
    post '/api/v1/locations', params: { galaxy: "Test Galaxy", planet: "Test Planet"}, headers: {Authorization: ENV['DROID_SHOP_API_KEY']}
  end

  it "returns error response when fields are left blank" do
    post '/api/v1/locations', params: { galaxy: "", planet: ""}, headers: {Authorization: ENV['DROID_SHOP_API_KEY']}
    expect(response).to have_http_status(422)
  end

  it "returns the locations galaxy" do
    expect(JSON.parse(response.body)['galaxy']).to eq "Test Galaxy"
  end

  it "returns the locations planet" do
    expect(JSON.parse(response.body)['planet']).to eq "Test Planet"
  end

  it "returns a created status" do
    expect(response).to have_http_status(:created)
  end
end
