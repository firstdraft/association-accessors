class AddOmniauthToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :github_access_token, :string
    add_column :users, :provider, :string
    add_column :users, :uid, :string
  end
end
