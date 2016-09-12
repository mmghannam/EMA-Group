class RemovePlacedFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders,:placed
  end
end
