class AddUsernameToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :first_name, :string, limit: 20
    add_column :accounts, :last_name, :string, limit: 20
    add_column :accounts, :user_name, :string, limit: 20
  end
end
