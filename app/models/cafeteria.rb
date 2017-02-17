class Cafeteria < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true

  has_many :menus
  has_many :dishes
end
