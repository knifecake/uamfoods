class CreateCafeterias < ActiveRecord::Migration[5.0]
  def change
    create_table :cafeterias do |t|
      t.string :name
      t.string :location
      t.string :hours
      t.string :phone
      t.boolean :needs_mentor

      t.timestamps
    end
  end
end
