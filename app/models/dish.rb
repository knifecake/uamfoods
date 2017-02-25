class Dish < ApplicationRecord
  belongs_to :cafeteria
  has_many :menus, through: :dish_menus
  has_many :dish_menus
  has_many :dish_votes

  validates :cafeteria, presence: true
  validates :name, presence: true

  after_initialize :set_defaults

  def upvotes
    dish_votes.where(value: 1).count
  end

  def downvotes
    dish_votes.where(value: -1).count
  end

  def upvote!(user)
    r = dish_votes.new(user: user, value: 1)
    if r.save
      self.score += 1
      self.save
    end
    return r
  end

  def downvote!(user)
    r = dish_votes.new(user: user, value: -1)
    if r.save
      self.score += -1
      self.save
    end
    return r
  end

  private
    def set_defaults
      self.score ||= 0
    end
end
