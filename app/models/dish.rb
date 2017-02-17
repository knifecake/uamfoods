class Dish < ApplicationRecord
  belongs_to :cafeteria
  has_many :menus, through: :dish_menus
  has_many :dish_menus

  validates :cafeteria, presence: true
  validates :name, presence: true
end
