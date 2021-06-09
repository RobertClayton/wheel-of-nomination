class CreateSpins < ActiveRecord::Migration[6.0]
  def change
    create_table :spins do |t|

      t.timestamps
    end
  end
end
