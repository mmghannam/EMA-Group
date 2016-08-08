class RenameTypeToPositionForUsers < ActiveRecord::Migration
  def change
    rename_column :users,:type,:position
  end
end
