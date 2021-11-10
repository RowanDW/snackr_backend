class Api::V1::UsersController < ApplicationController
  def login
    user = User.find_or_create_by(email: params[:email])
    user.name = params[:name] if user.name.nil?
    user.access_token = params[:access_token]
    render json: UserSerializer.new(user), status: :ok
  end
end
