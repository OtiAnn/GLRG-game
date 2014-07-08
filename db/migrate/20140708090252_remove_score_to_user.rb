class RemoveScoreToUser < ActiveRecord::Migration
  def change
    remove_column :users, :score, :integer, :default => 0
  end
end
