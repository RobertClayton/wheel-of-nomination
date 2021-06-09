class DefaultPowerUpsToFalse < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :phone_a_friend, :boolean, default: false
    change_column :users, :ask_the_team, :boolean, default: false
    change_column :users, :fifty_fifty, :boolean, default: false
  end
end
