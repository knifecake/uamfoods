class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.references :cafeteria, foreign_key: true
      t.date :served_at
      t.string :meal

      t.timestamps
    end
  end
end
