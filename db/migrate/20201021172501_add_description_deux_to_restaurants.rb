class AddDescriptionDeuxToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :descriptionDeux, :text
  end
end
