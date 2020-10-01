class CreateRestaurants < ActiveRecord::Migration[6.0]
    def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :rating
      t.text :description
      t.text :address
      t.text :style
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
