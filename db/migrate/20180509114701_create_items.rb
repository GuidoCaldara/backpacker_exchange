class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.string :location
      t.string :city
      t.string :country
      t.string :photo
      t.string :country
      t.string :country_code
      t.float :latitude
      t.float :longitude
      t.integer :price, default: nil
      t.boolean :free, default: false
      t.date :available_from
      t.date :available_to
      t.references :user, foreign_key: true
      t.timestamps null: false
    end
  end
end
