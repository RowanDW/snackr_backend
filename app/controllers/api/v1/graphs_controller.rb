class Api::V1::GraphsController < ApplicationController
  def index
    if User.exists?(params[:id])
      user = User.find(params[:id])
      highest = Graph.ten_highest_ranked(user)
      lowest = Graph.ten_lowest_ranked(user)
      render json: GraphSerializer.get_graphs(highest, lowest)
    else
      render json: { error: 'not found' }, status: :not_found
    end
  end
end
