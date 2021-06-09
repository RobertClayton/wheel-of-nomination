class SetActiveDefaultToTrue < ActiveRecord::Migration[6.0]
  def change
    change_column :questions, :active, :boolean, default: true
  end
end
