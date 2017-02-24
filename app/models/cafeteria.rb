class Cafeteria < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  validates :hours, presence: true

  has_many :menus
  has_many :dishes

  def this_weeks_menus
    mon = DateTime.now - DateTime.now.wday
    sun = 1.week.from_now
    return menus.includes(:dishes).where(served_at: mon..sun)
  end
end
