class Dish < ApplicationRecord
  belongs_to :cafeteria
  has_many :menus, through: :dish_menus
  has_many :dish_menus
  has_many :dish_votes

  validates :cafeteria, presence: true
  validates :name, presence: true

  after_initialize :set_defaults

  def score
    upvotes - downvotes
  end

  def upvote!(user)
    if (downvoted_by? user)
      dish_votes.find_by(user: user, value: -1).destroy ? :done : :fail
    else
      dish_votes.create(user: user, value: 1).persisted? ? :done : :fail
    end
  end

  def downvote!(user)
    if upvoted_by?(user)
      dish_votes.find_by(user: user, value: 1).destroy ? :done : :fail
    else
      dish_votes.create(user: user, value: -1).persisted? ? :done : :fail
    end
  end

  def upvoted_by?(user)
    dish_votes.where(user: user, value: 1).count == 1
  end

  def downvoted_by?(user)
    dish_votes.where(user: user, value: -1).count == 1
  end

  private
    def set_defaults
      self.upvotes ||= 0
      self.downvotes ||= 0
    end
end
