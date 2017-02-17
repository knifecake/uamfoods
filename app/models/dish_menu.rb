class DishMenu < ApplicationRecord
  belongs_to :menu
  belongs_to :dish
end
