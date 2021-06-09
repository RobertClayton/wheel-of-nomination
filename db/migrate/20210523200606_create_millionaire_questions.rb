class CreateMillionaireQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :millionaire_questions do |t|
      t.string :question
      t.string :a
      t.string :b
      t.string :c
      t.string :d
      t.string :answer
      t.boolean :active
    end
  end
end
