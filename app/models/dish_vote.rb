class DishVote < ApplicationRecord
  belongs_to :dish
  belongs_to :user

  validates :value, uniqueness: { scope: [:dish, :user] }

  before_create :set_current_timestamp

  # update dish vote cache on create/delete
  after_create :update_dish_create
  after_destroy :update_dish_destroy

  private
    def set_current_timestamp
      self.voted_at = DateTime.now
    end

    def update_dish(delete)
      unless delete
        if (self.value > 0)
          self.dish.upvotes += self.value
        else
          self.dish.downvotes -= self.value
        end
      else
        if (self.value > 0)
          self.dish.upvotes -= self.value
        else
          self.dish.downvotes += self.value
        end
      end
      self.dish.save
    end

    def update_dish_create
      update_dish(false)
    end

    def update_dish_destroy
      # tell update_dish we're deleting
      update_dish(true)
    end
end
