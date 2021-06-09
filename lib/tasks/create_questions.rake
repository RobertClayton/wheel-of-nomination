# frozen_string_literal: true

module Tasks
  class CreateQuestions

    include Rake::DSL

    def initialize
      namespace :exec do
        desc 'Parse and create questions'
        task create_questions: [:environment] do
          puts "Currently #{Question.all.count} question"
          puts 'Creating Questions...'
          puts '---'

          parsed_questions.each_slice(100) do |questions|
            create_questions(questions)
          end

          puts 'Completed'
          puts "#{Question.all.count} total questions"
          puts '------------------------'
        end
      end
    end

    private

    def create_questions(attributes)
      Question.insert_all(attributes)
    end

    def count
      @count ||= parsed_questions.count
    end

    def parsed_questions
      @parsed_questions ||= JSON.parse(
        File.read(file_path)
      )
    end

    def file_path
      Rails.root.join('lib', 'assets', 'questions.json')
    end
  end
end

Tasks::CreateQuestions.new
