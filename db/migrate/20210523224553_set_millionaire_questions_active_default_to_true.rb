class SetMillionaireQuestionsActiveDefaultToTrue < ActiveRecord::Migration[6.0]
  def change
    change_column :millionaire_questions, :active, :boolean, default: true
  end
end
