class AddPricePharmacyToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :price_pharmacy, :integer, default:0
  end
end
