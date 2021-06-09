class NominationController < ApplicationController

  def create
    user = User.find(params[:user])
    user.score_multiplier = 1
    user.fifty_fifty = false
    user.phone_a_friend = false
    user.ask_the_team = false
    user.save

    Nomination.create(date: DateTime.now, user_id: user.id)

    redirect_to millionaire_path(user: user.id)
  end
end
