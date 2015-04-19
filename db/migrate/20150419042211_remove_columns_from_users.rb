class RemoveColumnsFromUsers < ActiveRecord::Migration
  def up
    change_table(:users) do |t|
        t.remove  :email, :encrypted_password, :reset_password_token, 
                  :reset_password_sent_at, :remember_created_at, :sign_in_count,
                  :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip,
                  :last_sign_in_ip, :confirmation_token, :confirmed_at,
                  :confirmation_sent_at, :unconfirmed_email, :created_at,
                  :updated_at
    end
  end

  def down
    add_column :users,  :email
    add_column :users,  :encrypted_password 
    add_column :users,  :reset_password_token
    add_column :users,  :reset_password_sent_at 
    add_column :users,  :remember_created_at 
    add_column :users,  :sign_in_count
    add_column :users,  :current_sign_in_at 
    add_column :users,  :last_sign_in_at 
    add_column :users,  :current_sign_in_ip
    add_column :users,  :last_sign_in_ip 
    add_column :users,  :confirmation_token 
    add_column :users,  :confirmed_at
    add_column :users,  :confirmation_sent_at 
    add_column :users,  :unconfirmed_email 
    add_column :users,  :created_at
    add_column :users,  :updated_at
  end
end
