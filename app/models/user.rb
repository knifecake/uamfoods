class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, omniauth_providers: [:github]

  has_many :dish_votes

  validates :name, presence: true

  def has_upvoted?(dish)
    dish_votes.where(dish: dish, value: 1).count == 1
  end

  def has_downvoted?(dish)
    dish_votes.where(dish: dish, value: -1).count == 1
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |u|
      u.email = auth.info.email
      u.password = Devise.friendly_token[0,20]
      u.name = auth.info.name
    end
  end
end
