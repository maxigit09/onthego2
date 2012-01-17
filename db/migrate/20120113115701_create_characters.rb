class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.string :address
      t.float :longitude
      t.float :latitude
      t.boolean :gmaps
      t.references :bemap

      t.timestamps
    end
    add_index :characters, :bemap_id
  end
end
