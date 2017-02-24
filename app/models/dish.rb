class Dish < ApplicationRecord
  belongs_to :cafeteria
  has_many :menus, through: :dish_menus
  has_many :dish_menus
  has_many :dish_votes

  validates :cafeteria, presence: true
  validates :name, presence: true

  def upvotes
    dish_votes.where(value: 1).count
  end

  def downvotes
    dish_votes.where(value: -1).count
  end

  def score
    upvotes - downvotes
  end

  def upvote!(user)
    dish_votes.create(user: user, value: 1)
  end

  def downvote!(user)
    dish_votes.create(user: user, value: -1)
  end
end
