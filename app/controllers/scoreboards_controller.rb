class ScoreboardsController < ApplicationController

  def new
    user = User.find(params[:user_id])
    user.update(
      {
        score: user.score += params[:money].tr('$', '').to_i,
        score_multiplier: user.score_multiplier >= 14 ? user.score_multiplier = 1 : user.score_multiplier += 1,
        fifty_fifty: params[:fifty_fifty] == 'true' ? true : false,
        phone_a_friend: params[:phone_a_friend] == 'true' ? true : false,
        ask_the_team: params[:ask_the_team] == 'true' ? true : false
      }
    )

    if params[:five_in_a_row]
      redirect_to nominations_wheel_nomination_path(user_id: params[:user_id])
    else
      redirect_to millionaire_path(user: params[:user_id])
    end
  end
end
