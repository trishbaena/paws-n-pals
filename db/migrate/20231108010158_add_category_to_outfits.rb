class AddCategoryToOutfits < ActiveRecord::Migration[7.1]
  def change
    add_reference :outfits, :category, null: false, foreign_key: true
  end
end
