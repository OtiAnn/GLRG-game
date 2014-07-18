class AddSecretToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :secret, :string
  end
end
