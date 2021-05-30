class MillionaireController < ApplicationController
  require 'json'
  require 'net/http'
  require 'cgi'
  require 'pry'

  attr_accessor :questions

  def index
    @user = User.find(params[:user])
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
end
