require 'rails_helper'

describe "get all shops from single location" do
  let!(:location) { FactoryBot.create(:location) }
  let!(:shops) { FactoryBot.create_list(:shop, 20, location: location) }

  before { get "/api/v1/locations/#{location.id}/shops", headers: {Authorization: ENV['YELP_API_KEY']}}

  it 'returns all shops for a location' do
    expect(JSON.parse(response.body).size).to eq 20
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  context "when given a shop id" do
    it "returns one shop" do
      get "/api/v1/locations/#{location.id}/shops/#{shops.first['id']}", headers: {Authorization: ENV['DROID_SHOP_API_KEY']}
      expect(JSON.parse(response.body)['id']).to eq shops.first['id']
    end
  end

  context "when given a shop name" do
    it "returns one shop" do
      get "/api/v1/locations/#{location.id}/shops?name=#{shops.first['name']}", headers: {Authorization: ENV['DROID_SHOP_API_KEY']}
      expect(JSON.parse(response.body).first['name']).to eq shops.first['name']
    end
  end

  context "when given a shop owner" do
    it "returns one shop" do
      get "/api/v1/locations/#{location.id}/shops?owner=#{shops.first['owner']}", headers: {Authorization: ENV['DROID_SHOP_API_KEY']}
      expect(JSON.parse(response.body).first['owner']).to eq shops.first['owner']
    end
  end

  context "when given a shop rating" do
    it "returns one shop" do
      get "/api/v1/locations/#{location.id}/shops?rating=#{shops.first['rating']}", headers: {Authorization: ENV['DROID_SHOP_API_KEY']}
      expect(JSON.parse(response.body).first['rating']).to eq shops.first['rating']
    end
  end

  context "when given a shop droid" do
    it "returns one shop" do
      get "/api/v1/locations/#{location.id}/shops?droid=#{shops.first['droid']}", headers: {Authorization: ENV['DROID_SHOP_API_KEY']}
      expect(JSON.parse(response.body).first['droid']).to eq shops.first['droid']
    end
  end

end
