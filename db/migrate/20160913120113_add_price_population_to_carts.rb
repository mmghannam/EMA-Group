class AddPricePopulationToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :price_population, :integer, default:0
  end
end
