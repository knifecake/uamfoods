class ChangeScoreToCafeterias < ActiveRecord::Migration[5.0]
  def change
    remove_column :dishes, :score
    add_column :dishes, :upvotes, :integer
    add_column :dishes, :downvotes, :integer
  end
end
