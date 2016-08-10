class AddPricePrecision < ActiveRecord::Migration
    def change
        change_column :products, :price_pharmacy, :decimal, :precision => 10, :scale => 6
        change_column :products, :price_population, :decimal, :precision => 10, :scale => 6
    end
end
