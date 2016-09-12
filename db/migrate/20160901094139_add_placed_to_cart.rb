class AddPlacedToCart < ActiveRecord::Migration
  def change
    add_column :carts, :placed, :boolean, default: false
  end
end
