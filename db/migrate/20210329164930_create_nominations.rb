class CreateNominations < ActiveRecord::Migration[6.0]
  def change
    create_table :nominations do |t|
      t.date :date
    end
  end
end
