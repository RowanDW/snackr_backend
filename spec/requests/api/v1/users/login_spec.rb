require "rails_helper"

RSpec.describe "Login User" do
  it 'adds a new user to the database' do
    get '/api/v1/users', params: {name: "Billy Bob", email: "billybob@gmail.com", access_token: "daigrjslei23590sdgjkl"}

    expect(response).to be_successful

    user = JSON.parse(response.body, symbolize_names: true)
    expect(user).to have_key(:data)
    expect(user[:data]).to be_a(Hash)
    expect(user[:data]).to have_key(:type)
    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:id]).to be_a(String)
    expect(user[:data][:type]).to eq("user")
    expect(user[:data][:attributes]).to be_a(Hash)
    expect(user[:data][:attributes]).to have_key(:name)
    expect(user[:data][:attributes][:name]).to be_a(String)
  end

  it 'finds user' do
    user = User.create!(name: "Billy Bob", email: "billybob@gmail.com", access_token: "daigrjslei23590sdgjkl")
    get "/api/v1/users", params: {email: user.email, access_token: user.access_token}

    expect(response).to be_successful


    user = JSON.parse(response.body, symbolize_names: true)
    expect(user).to have_key(:data)
    expect(user[:data]).to be_a(Hash)
    expect(user[:data]).to have_key(:type)
    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:id]).to be_a(String)
    expect(user[:data][:type]).to eq("user")
    expect(user[:data][:attributes]).to be_a(Hash)
    expect(user[:data][:attributes]).to have_key(:name)
    expect(user[:data][:attributes][:name]).to be_a(String)
  end
end
