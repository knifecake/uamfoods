class Admin < ApplicationRecord
  devise :database_authenticatable, :confirmable, :lockable,
            :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
end
