class DishMenu < ApplicationRecord
  belongs_to :menu
  belongs_to :dish

  def self.first_courses
    includes(:dish).where(course: 'primero')
  end

  def self.second_courses
    where(course: 'segundo')
  end

  def self.desserts
    where(course: 'postre')
  end
end
