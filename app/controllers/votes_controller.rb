class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_dish


  def upvote
    if @dish.upvote!(current_user)
      render json: @dish, status: :created
    else
      render head: :unprocessable_entity
    end
  end

  def downvote
    if @dish.downvote!(current_user)
      render json: @dish, status: :created
    else
      render head: :unprocessable_entity
    end
  end

  private
    def set_dish
      @dish = Dish.find(params[:id])
    end
end
