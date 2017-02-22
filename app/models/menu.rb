class Menu < ApplicationRecord
  validates :meal, presence: true
  validates :cafeteria, presence: true

  belongs_to :cafeteria
  has_many :dish_menus
  has_many :dishes, through: :dish_menus
end
