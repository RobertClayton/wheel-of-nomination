class AddScoreMultiplierToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :score_multiplier, :integer, default: 1
  end
end
