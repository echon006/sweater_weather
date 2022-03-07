require 'rails_helper'

RSpec.describe 'Image API' do
  it 'returns a Image in JSON', :vcr do

    get "/api/v1/images?location=Denver,CO"

    image = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)

    expect(image).to be_a Hash
    expect(image).to have_key :data

    expect(image[:data]).to have_key :id
    expect(image[:data]).to have_key :type
    expect(image[:data][:type]).to eq("image")
    expect(image[:data]).to have_key :attributes
    expect(image[:data][:attributes]).to be_a Hash

    expect(image[:data][:attributes]).to have_key :url
    expect(image[:data][:attributes][:url]).to be_a String

    expect(image[:data][:attributes]).to have_key :credit
    expect(image[:data][:attributes][:credit]).to be_an Hash
  end
end
