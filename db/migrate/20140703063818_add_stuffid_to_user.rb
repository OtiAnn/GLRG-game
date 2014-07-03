class AddStuffidToUser < ActiveRecord::Migration
  def change
    add_column :users, :stuff_id, :integer
  end
end
