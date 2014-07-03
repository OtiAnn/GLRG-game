class RemoveStuffidToUser < ActiveRecord::Migration
  def change
    remove_column :users, :stuff_id, :integer
  end
end
