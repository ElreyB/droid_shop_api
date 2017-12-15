require 'rails_helper'

describe "post a shop route" do
  let!(:location) { FactoryBot.create(:location) }

  before do
    post "/api/v1/locations/#{location.id}/shops", params: { name: 'Test Name', owner: 'Test Owner', motto: 'Test Motto', rating: 7, droid: 'Test Droid'}, headers: {Authorization: ENV['DROID_SHOP_API_KEY']}
  end

  it 'returns the shop name' do
    expect(JSON.parse(response.body)['name']).to eq 'Test Name'
  end

  it 'returns the shop onwer' do
    expect(JSON.parse(response.body)['owner']).to eq 'Test Owner'
  end

  it 'returns the shop motto' do
    expect(JSON.parse(response.body)['motto']).to eq 'Test Motto'
  end

  it 'returns the shop rating' do
    expect(JSON.parse(response.body)['rating']).to eq 7
  end

  it 'returns the shop droid' do
    expect(JSON.parse(response.body)['droid']).to eq 'Test Droid'
  end

  it "returns a created status" do
    expect(response).to have_http_status(:created)
  end

end
