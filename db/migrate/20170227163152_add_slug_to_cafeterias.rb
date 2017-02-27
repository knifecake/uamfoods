class AddSlugToCafeterias < ActiveRecord::Migration[5.0]
  def change
    add_column :cafeterias, :slug, :string
    add_index :cafeterias, :slug
  end
end
