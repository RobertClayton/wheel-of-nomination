class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :category
      t.string :question
      t.string :answer
      t.string :money
      t.string :date
      t.integer :episode
      t.boolean :active

      t.timestamps
    end
  end
end
