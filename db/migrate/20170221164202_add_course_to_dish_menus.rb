class AddCourseToDishMenus < ActiveRecord::Migration[5.0]
  def change
    add_column :dish_menus, :course, :string
  end
end
