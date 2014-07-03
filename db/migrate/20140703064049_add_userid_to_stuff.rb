class AddUseridToStuff < ActiveRecord::Migration
  def change
    add_column :stuffs, :user_id, :integer
  end
end
