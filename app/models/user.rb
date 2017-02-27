class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :dish_votes

  validates :name, presence: true

  def has_upvoted?(dish)
    dish_votes.where(dish: dish, value: 1).count == 1
  end

  def has_downvoted?(dish)
    dish_votes.where(dish: dish, value: -1).count == 1
  end
end
