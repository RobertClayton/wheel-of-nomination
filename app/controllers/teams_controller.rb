class TeamsController < ApplicationController

  def new
    @team = Team.new
  end

  def index
    @teams = Team.all.sort_by { |user| user.name }
  end

  def show
    @team = Team.find(params[:id])
  end

  def edit
    @team = Team.find(params[:id])
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    redirect_to teams_path
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to @team
    else
      render 'new'
    end
  end

  def update
    @team = Team.find(params[:id])

    if @team.update(team_params)
      redirect_to @team
    else
      render 'edit'
    end
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end

end
