class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      # t.database_authenticatable :null => false
      # t.recoverable
      t.rememberable
      # t.trackable
    
      # Username is CNetID
      t.string :username, :null => false, :default => ""
      t.string :email
      t.string :first_name
      t.string :last_name

      # Administrative Properties
      t.boolean :is_admin, :null => false, :default => false
      t.boolean :is_readonly, :null => false, :default => true

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable

      t.timestamps
    end

    add_index :users, :username,                :unique => true
    # add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
    # add_index :users, :authentication_token, :unique => true
  end

  def self.down
    drop_table :users
  end
end
