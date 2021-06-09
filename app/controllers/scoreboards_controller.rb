class ScoreboardsController < ApplicationController

  def new
    user = User.find(params[:user])
    user.score += params[:money].tr('$', '').to_i
    user.score_multiplier >= 14 ? user.score_multiplier = 1 : user.score_multiplier += 1
    user.fifty_fifty = params[:fifty_fifty] == 'true' ? true : false
    user.phone_a_friend = params[:phone_a_friend] == 'true' ? true : false
    user.ask_the_team = params[:ask_the_team] == 'true' ? true : false
    user.save

    redirect_to millionaire_path(user: user.id)
  end

end
