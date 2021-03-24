class HomeController < ApplicationController
  require 'json'
  require 'net/http'
  require 'cgi'

  attr_accessor :questions

  def initialize
    super
    @questions = get_questions
  end

  def index
    @names = calculate_names
    @question = questions.pop
  end

  private

  def calculate_names
    current = [
      "Robert",
      "Jiggins",
      "Hamid",
      "Danijel",
      "Mario",
      "Andrew",
      "Lavanya",
      "Joe",
      "Gulnur"
    ]

    names = current
    until names.count >= 12
      names += current.clone.shuffle[0..(12 - current.count) - 1]
    end
    names
  end

  def get_questions
    uri = URI("https://opentdb.com/api.php?amount=1&category=9&difficulty=hard&type=multiple")
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

  def format_answers(answers)
    answers.map do |answer|
      CGI.unescapeHTML(answer)
    end
      .shuffle
  end
end
