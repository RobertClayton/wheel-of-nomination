class AddTimestampsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_timestamps :users, null: true
  end
end
