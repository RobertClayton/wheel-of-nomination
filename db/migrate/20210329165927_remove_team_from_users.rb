class RemoveTeamFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :team
  end
end
