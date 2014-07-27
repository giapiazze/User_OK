class AddLockableToUsers < ActiveRecord::Migration
  def change
    ## Lockable
    add_column :users, :failed_attempts, :integer, value: 0, null: false  # Only if lock strategy is :failed_attempts
    add_column :users, :unlock_token, :string                             # Only if unlock strategy is :email or :both
    add_column :users, :locked_at, :datetime

    #add_index :users, :email,                unique: true
    #add_index :users, :reset_password_token, unique: true
    #add_index :users, :confirmation_token,   unique: true
    add_index :users, :unlock_token,          unique: true
  end
end
