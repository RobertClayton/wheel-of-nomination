class MillionaireController < ApplicationController
  require 'json'
  require 'net/http'
  require 'cgi'
  require 'pry'

  attr_accessor :questions

  def index
    @user = User.find(params[:user])
    @money = money[@user.score_multiplier - 1]
    @question = fetch_question
    @fiftyfifty = %w(a b c d).excluding(@question.answer).sample(2)
    @users = User.all
    @scoreboard = @users.sort_by(&:score).reverse
    @nominations = Nomination.last(10).sort_by(&:date).reverse
  end

  private

  def fetch_question
    q = MillionaireQuestion.order(Arel.sql('RANDOM()')).first

    q.active ? q : fetch_question
  end

  def money
    [
      { number: 100, word: "100" },
      { number: 200, word: "200" },
      { number: 300, word: "300" },
      { number: 500, word: "500" },
      { number: 1_000, word: "1,000" },
      { number: 2_000, word: "2,000" },
      { number: 4_000, word: "4,000" },
      { number: 8_000, word: "8,000" },
      { number: 16_000, word: "16,000" },
      { number: 32_000, word: "32,000" },
      { number: 64_000, word: "64,000" },
      { number: 125_000, word: "125,000" },
      { number: 250_000, word: "250,000" },
      { number: 500_000, word: "500,000" },
      { number: 1_000_000, word: "1,000,000" }
    ]
  end
end
