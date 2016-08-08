class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :category_id
      t.string :name
      t.decimal :price_pharmacy
      t.decimal :price_population
      t.text :comments

      t.timestamps null: false
    end
  end
end
