class ScoreboardsController < ApplicationController

  def new
    user = User.find(params[:user])
    user.score += params[:money].tr('$', '').to_i
    user.fifty_fifty = params[:fifty_fifty] == 'true' ? true : false
    user.save

    redirect_to millionaire_path(user: user.id)
  end

end
