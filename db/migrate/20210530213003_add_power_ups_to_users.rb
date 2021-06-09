class AddPowerUpsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :phone_a_friend, :boolean, default: true
    add_column :users, :ask_the_team, :boolean, default: true
    add_column :users, :fifty_fifty, :boolean, default: true
  end
end
