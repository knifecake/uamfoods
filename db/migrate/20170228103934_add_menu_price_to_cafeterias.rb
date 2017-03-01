class AddMenuPriceToCafeterias < ActiveRecord::Migration[5.0]
  def change
    add_column :cafeterias, :menu_price, :string
    remove_column :cafeterias, :needs_mentor
  end
end
