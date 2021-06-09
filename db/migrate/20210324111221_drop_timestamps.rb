class DropTimestamps < ActiveRecord::Migration[6.0]
  def change
    remove_column :questions, :created_at
    remove_column :questions, :updated_at
  end
end
