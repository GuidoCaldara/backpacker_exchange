class CreateFavouritesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :favourites do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.timestamps null: false
    end
  end
end
