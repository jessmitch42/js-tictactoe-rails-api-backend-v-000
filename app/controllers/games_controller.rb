class GamesController < ApplicationController
  # Add your GamesController code here

  def show
    @game = Game.find(params[:id]) || Game.all.first
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @game }
    end
  end

  def create
    @game = Game.create(game_params)
    render json: @game, status: 201
    # render 'home/index'
  end

  def update
    @game = Game.find(params[:id])
    @game.update(params)
    render 'home/index'
  end

  private

  def game_params
    params.permit(:state => [])
  end
end
