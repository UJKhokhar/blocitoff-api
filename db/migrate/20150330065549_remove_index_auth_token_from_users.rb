class RemoveIndexAuthTokenFromUsers < ActiveRecord::Migration
  def up
    remove_index :users, :auth_token
  end

  def down
    add_index :users, :auth_token
  end
end
