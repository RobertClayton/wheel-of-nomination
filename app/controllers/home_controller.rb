class HomeController < ApplicationController
  require 'json'
  require 'net/http'
  require 'cgi'

  def index
    @names = calculate_names
    @question = question
  end

  private

  def calculate_names
    current = [
      "Robert",
      "Jiggins",
      "Jayes",
      "Hamid",
      "Danijel",
      "Mario",
      "Andrew",
      "Lavanya"
    ]

    num_to_fill = 12 - current.count
    (current + current.clone.shuffle[0..num_to_fill - 1])
  end

  def question
    get_questions.pop
  end

  def get_questions
    @get_questions ||= begin
      # uri = URI("https://opentdb.com/api.php?amount=50&difficulty=medium&type=multiple")
      uri = URI("https://opentdb.com/api.php?amount=50&category=9&difficulty=medium&type=multiple")
      raw_response = Net::HTTP.get(uri)
      JSON.parse(raw_response)["results"].map do |question|
        {
          category: question["category"],
          type: question["type"],
          difficulty: question["difficulty"],
          question: CGI.unescapeHTML(question["question"]),
          correct_answer: question["correct_answer"],
          incorrect_answers: question["incorrect_answers"],
          answers: format_answers([question["correct_answer"]] + question["incorrect_answers"])
        }
      end
    end
  end

  def format_answers(answers)
    answers.map do |answer|
      CGI.unescapeHTML(answer)
    end
      .shuffle
  end
end
