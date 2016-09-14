class ChangeTypeOfPricesForOrdersAndCarts < ActiveRecord::Migration
  def change
    change_column :orders, :price_pharmacy, :decimal, :precision => 10, :scale => 6
    change_column :orders, :price_population, :decimal, :precision => 10, :scale => 6
    change_column :carts, :price_pharmacy, :decimal, :precision => 10, :scale => 6
    change_column :carts, :price_population, :decimal, :precision => 10, :scale => 6
  end
end
