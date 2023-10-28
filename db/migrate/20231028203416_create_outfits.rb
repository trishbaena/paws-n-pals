class CreateOutfits < ActiveRecord::Migration[7.1]
  def change
    create_table :outfits do |t|
      t.string :name
      t.text :description
      t.string :photo_url
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
