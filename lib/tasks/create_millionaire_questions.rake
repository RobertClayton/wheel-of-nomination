# frozen_string_literal: true

module Tasks
  class CreateMillionaireQuestions

    include Rake::DSL

    def initialize
      namespace :exec do
        desc 'Parse and create questions'
        task create_millionaire_questions: [:environment] do
          puts "Currently #{MillionaireQuestion.all.count} questions"
          puts 'Creating Millionaire Questions...'
          puts '---'

          millionaire_questions.each_slice(100) do |questions|
            create_questions(questions)
          end

          puts 'Completed'
          puts "#{MillionaireQuestion.all.count} total questions"
          puts '------------------------'
        end
      end
    end

    private

    def create_questions(attributes)
      MillionaireQuestion.insert_all(attributes)
    end

    def millionaire_questions
      @millionaire_questions ||= JSON.parse(
        File.read(file_path)
      )
    end

    def file_path
      Rails.root.join('lib', 'assets', 'millionaire_pastebin.json')
    end
  end
end

Tasks::CreateMillionaireQuestions.new
