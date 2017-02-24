class AddImageUrlToCafeterias < ActiveRecord::Migration[5.0]
  def change
    add_column :cafeterias, :image_url, :string
  end
end
