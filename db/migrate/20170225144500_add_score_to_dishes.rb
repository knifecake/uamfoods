class AddScoreToDishes < ActiveRecord::Migration[5.0]
  def change
    add_column :dishes, :score, :integer
  end
end
