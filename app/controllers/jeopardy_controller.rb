class JeopardyController < ApplicationController
  require 'json'
  require 'net/http'
  require 'cgi'
  require 'pry'

  attr_accessor :questions

  def index
    @user = User.find(params[:user])
    @question = get_question
    @users = User.all
    @scoreboard = @users.sort_by(&:score).reverse
    @nominations = Nomination.all.sort_by(&:date).reverse
  end

  private

  def get_question
    format_question(fetch_question)
  end

  def fetch_question
    q = Question.order(Arel.sql('RANDOM()')).first

    q.active ? q : fetch_question
  end

  def format_question(q)
    {
      category: q.category,
      question: q.question,
      answer: q.answer,
      money: q.money,
      date: q.date,
      episode: q.episode
    }
  end
end
