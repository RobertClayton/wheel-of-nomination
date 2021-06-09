class NominationController < ApplicationController

  def create
    user = User.find(params[:user])
    Nomination.create(date: DateTime.now, user_id: user.id)

    redirect_to jeopardy_path(user: user.id)
  end
end
