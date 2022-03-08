require 'rails_helper'

RSpec.describe 'Users API' do

  it 'creates a user and generates unique api key associated with user' do
    user_info = {
                email: 'test_1@email.com',
                password: 'password_1',
                password_confirmation: 'password_1'
                }
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users", headers: headers, params: JSON.generate(user_info)

    created_user = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(201)
    expect(created_user).to have_key(:data)
    expect(created_user[:data][:type]).to eq("user")
    expect(created_user[:data][:attributes]).to have_key(:email)
    expect(created_user[:data][:attributes]).to have_key(:api_key)
    expect(created_user[:data][:attributes]).not_to have_key(:password)
    expect(created_user[:data][:attributes]).not_to have_key(:password_confirmation)
  end

  it "returns error when password confirmation and password do not match" do
    user_info = {
                email: 'test_1@email.com',
                password: 'password_1',
                password_confirmation: 'password1'
                }

    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    post '/api/v1/users', headers: headers, params: JSON.generate(user_info)

    created_user = JSON.parse(response.body, symbolize_names: true)
    expect(response).to_not be_successful
    expect(response.status).to eq(404)
    expect(created_user[:data]).to have_key :message
    expect(created_user[:data][:message]).to eq("Passwords do not match")
  end
end
