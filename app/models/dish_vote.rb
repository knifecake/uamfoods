class DishVote < ApplicationRecord
  belongs_to :dish
  belongs_to :user

  validates :value, uniqueness: { scope: [:dish, :user] }

  before_create :set_current_timestamp
  def set_current_timestamp
    self.voted_at = DateTime.now
  end
end
