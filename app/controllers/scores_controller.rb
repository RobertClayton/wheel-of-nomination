class ScoresController < ApplicationController
  before_action :set_score, only: %i[ show edit update destroy ]

  def index
    @scores = Score.all.sort_by { |score| score.created_at }.reverse
  end

  def show
    @score = Score.find(params[:id])
  end

  def new
    @score = Score.new
  end

  def edit
    @score = Score.find(params[:id])
  end


  def create
    @score = Score.new(score_params)

    if @score.save
      redirect_to @score
    else
      render 'new'
    end
  end

  def update
    @score = Score.find(params[:id])

    if @score.update(score_params)
      redirect_to @score
    else
      render 'edit'
    end
  end

  def destroy
    @score = Score.find(params[:id])
    @score.destroy

    redirect_to scores_path
  end

  private
    def set_score
      @score = Score.find(params[:id])
    end

    def score_params
      params.require(:score).permit(:created_at, :updated_at)
    end
end
