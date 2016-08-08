class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :type
      t.string :name
      t.string :address
      t.string :landline_number
      t.string :mobile_number
      t.string :workplace

      t.timestamps null: false
    end
  end
end
