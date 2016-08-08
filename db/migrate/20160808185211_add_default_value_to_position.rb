class AddDefaultValueToPosition < ActiveRecord::Migration
  def change
    change_column :users, :position, :integer, :default => 1
  end
end
