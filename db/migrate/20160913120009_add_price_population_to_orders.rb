class AddPricePopulationToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :price_population, :integer, default:0
  end
end
