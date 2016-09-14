class AddPricePharmacyToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :price_pharmacy, :integer, default:0
  end
end
