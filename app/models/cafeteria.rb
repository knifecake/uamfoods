class Cafeteria < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  validates :hours, presence: true
  validates :slug, presence: true, format: { with: /\A[a-zA-Z0-9]+\z/,
    message: "solo caracteres alfanuméricos" }

  has_many :menus
  has_many :dishes

  def this_weeks_menus
    mon = DateTime.now
    sun = 1.week.from_now
    return menus.order(:served_at).where(served_at: mon..sun)
  end
end
