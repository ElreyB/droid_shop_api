require 'rails_helper'

describe "get all locations route", :type => :request do
  let!(:locations) { FactoryBot.create_list(:location, 10) }

  before { get '/api/v1/locations', headers: {Authorization: ENV['DROID_SHOP_API_KEY']}}

  it "returns all meals on page one" do
    expect(JSON.parse(response.body).size).to eq 10
  end

  it "returns status code 200" do
    expect(response).to have_http_status(:success)
  end

  context "when given an location id" do
    it "returns one location" do
      get "/api/v1/locations/#{locations.first['id']}", headers: {Authorization: ENV['DROID_SHOP_API_KEY']}
      expect(JSON.parse(response.body)['id']).to eq locations.first['id']
    end
  end

  context "when given an location galaxy" do
    it "returns one location" do
      get "/api/v1/locations/?galaxy=#{locations.first['galaxy']}", headers: {Authorization: ENV['DROID_SHOP_API_KEY']}
      expect(JSON.parse(response.body).first['galaxy']).to eq locations.first['galaxy']
    end
  end

  context "when given an location planet" do
    it "returns one location" do
      get "/api/v1/locations/?planet=#{locations.first['planet']}", headers: {Authorization: ENV['DROID_SHOP_API_KEY']}
      expect(JSON.parse(response.body).first['planet']).to eq locations.first['planet']
    end
  end
end
