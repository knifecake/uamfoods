class Menu < ApplicationRecord
  validates :meal, presence: true
  validates :cafeteria, presence: true

  belongs_to :cafeteria
  has_many :dish_menus
  has_many :dishes, through: :dish_menus

  def create_or_link_dish(dish_name)
    unless dish = cafeteria.dishes.find_by(name: dish_name)
      dishes << cafeteria.dishes.create(name: dish_name)
    else
      dishes << dish
    end
  end

  def unlink_dish(dish)
    dishes.delete(dish)
  end
end
