class AddPlacedToOrders < ActiveRecord::Migration
  def change
    add_column :orders,:placed,:boolean,:default => false
  end
end
