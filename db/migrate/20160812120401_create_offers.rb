class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :title
      t.text :description
      t.date :start
      t.date :end

      t.timestamps null: false
    end
  end
end
