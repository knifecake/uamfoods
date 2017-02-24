class CreateDishVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :dish_votes do |t|
      t.references :dish, foreign_key: true
      t.references :user, foreign_key: true
      t.datetime :voted_at
      t.integer :value
    end
  end
end
