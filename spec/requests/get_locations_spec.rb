require 'rails_helper'

describe "get all locations route", :type => :request do
  let!(:location) { FactoryBot.create_list(:location, 10) }

  before { get '/api/v1/locations' }

  it "returns all meals on page one" do
    expect(JSON.parse(response.body).size).to eq 10
  end

  it "returns status code 200" do
    expect(response).to have_http_status(:success)
  end
end
