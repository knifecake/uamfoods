class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_dish


  def upvote
    if vote = @dish.upvote!(current_user)
      render json: @dish.score, status: :created
    else
      render json: vote.errors, status: :unprocessable_entity
    end
  end

  def downvote
    if vote = @dish.downvote!(current_user)
      render json: @dish.score, status: :created
    else
      render json: vote.errors, status: :unprocessable_entity
    end
  end

  private
    def set_dish
      @dish = Dish.find(params[:id])
    end
end
