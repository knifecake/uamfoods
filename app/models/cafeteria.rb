class Cafeteria < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  validates :hours, presence: true

  has_many :menus
  has_many :dishes

  def this_weeks_menus
    mon = DateTime.now
    sun = 1.week.from_now
    return menus.order(:served_at).where(served_at: mon..sun)
  end
end
