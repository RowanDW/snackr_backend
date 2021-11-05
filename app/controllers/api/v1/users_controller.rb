class Api::V1::UsersController < ApplicationController

  def login
    user = User.find_or_create_by(email: params[:email])
    if user.name.nil?
      user.name = params[:name]
    end
    user.access_token = params[:access_token]
    render json: UserSerializer.new(user), status: 200
  end

  # def show
  #   user = User.find(params[:id])
  #   if user
  #     render json: UserSerializer.new(user), status: 200
  #   end
  #
  # end
  #
  # def create
  #   user = User.new(user_params)
  #   if user.save
  #     render json: UserSerializer.new(user), status: 201
  #   end
  # end

  private

  def user_params
    params.permit(:name, :email, :access_token)
  end
end
