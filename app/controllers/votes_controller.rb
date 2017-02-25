class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_dish


  def upvote
    vote = @dish.upvote!(current_user)
    if vote.persisted?
      render json: @dish.score, status: :created
    else
      render json: vote.errors, status: :unprocessable_entity
    end
  end

  def downvote
    vote = @dish.downvote!(current_user)
    if vote.persisted?
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
