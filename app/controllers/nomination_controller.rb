class NominationController < ApplicationController

  def failed_nomination
    user = User.find(params[:user_id])
    user.score_multiplier = 1
    user.fifty_fifty = false
    user.phone_a_friend = false
    user.ask_the_team = false
    user.save

    wheel_nomination
  end

  def wheel_nomination(user_id = params[:user_id].to_i)
    @nomination = Nomination.create(date: DateTime.now, user_id: user_id)

    redirect_to millionaire_path(user: user_id)
  end

  def new
    @nomination = Nomination.new
  end

  def index
    @nominations = Nomination.all.sort_by { |nomination| nomination.date }.reverse
  end

  def show
    @nomination = Nomination.find(params[:id])
  end

  def edit
    @nomination = Nomination.find(params[:id])
  end

  def destroy
    @nomination = Nomination.find(params[:id])
    @nomination.destroy

    redirect_to nomination_index_path
  end

  def create
    @nomination = Nomination.new(
      date: DateTime.new(params[:date][:year].to_i,
                         params[:date][:month].to_i,
                         params[:date][:day].to_i),
      user_id: params[:nomination][:user_id].to_i
    )

    if @nomination.save
      redirect_to @nomination
    else
      render 'new'
    end
  end

  def update
    @nomination = Nomination.find(params[:id])

    if @nomination.update(user_id: params[:nomination][:user_id].to_i,
                          date: DateTime.new(params[:date][:year].to_i,
                                             params[:date][:month].to_i,
                                             params[:date][:day].to_i))
      redirect_to @nomination
    else
      render 'edit'
    end
  end
end
