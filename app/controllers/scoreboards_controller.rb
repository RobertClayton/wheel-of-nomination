class ScoreboardsController < ApplicationController

  def new
    user = User.find(params[:user])
    user.score += params[:money].tr('$', '').to_i
    user.save

    redirect_to jeopardy_path(user: user.id)
  end

end
