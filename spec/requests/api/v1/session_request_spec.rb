require 'rails_helper'
RSpec.describe 'sessions request' do

  it "returns a session in JSON" do
    user_info = {
                email: 'test_1@email.com',
                password: 'password_1',
                password_confirmation: 'password_1'
                }
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users", headers: headers, params: JSON.generate(user_info)
    JSON.parse(response.body, symbolize_names: true)

    session = {
              "email": 'test_1@email.com',
              "password": 'password_1'
              }
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }

    post '/api/v1/sessions', headers: headers, params: JSON.generate(session)
    user = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(user[:data]).to have_key(:type)
    expect(user[:data]).to have_key(:id)
    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes]).to have_key(:api_key)
    expect(user[:data][:attributes]).to_not have_key(:password)
    expect(user[:data][:attributes]).to_not have_key(:password_confirmation)
  end

  it "returns a error if password not valid" do
    user_info = {
                email: 'test_1@email.com',
                password: 'password_1',
                password_confirmation: 'password_1'
                }
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users", headers: headers, params: JSON.generate(user_info)
    JSON.parse(response.body, symbolize_names: true)

    session = {
              "email": 'test_1@email.com',
              "password": 'password_2'
              }
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }

    post '/api/v1/sessions', headers: headers, params: JSON.generate(session)
    user = JSON.parse(response.body, symbolize_names: true)

    expect(response).not_to be_successful
    expect(response.status).to eq(404)
    expect(user[:data]).to have_key(:message)
    expect(user[:data][:message]).to eq("Email or passowrd is incorrect.")
  end
end
