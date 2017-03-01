class Menu < ApplicationRecord
  validates :meal, presence: true
  validates :cafeteria, presence: true
  validates :served_at, uniqueness: { scope: [:cafeteria, :meal] }

  belongs_to :cafeteria
  has_many :dish_menus
  has_many :dishes, through: :dish_menus

  def self.new_copy_from(date, menu_params)
    template = self.find_by(served_at: date)

    unless template
      return self.initialize(menu_params)
    end

    if menu_params[:served_at] == ""
      menu_params[:served_at] = Date.today
    end

    new = template.deep_clone include: :dish_menus
    new.assign_attributes(menu_params)
    return new
  end
end
