class UsersController < ApplicationController
  respond_to :html, :js

  def show
    current_user
    @games = @current_user.games
  end

  # def games_api
  #   respond_to do |format|
  #     format.json do
  #       id = params[:id]
  #       @result = Game.find(id)
  #       render json: @result
  #     end
  #   end
  # end

  def retrieve_game
    respond_to do |format|
      format.json do
        id = params[:id]
        @result = Game.find(id)
        render json: @result
      end
    end
  end

  def create_game
    respond_to do |format|
      format.json do
        user_id = params[:user_id]
        state = params[:state]
        game = Game.new
        game.state = state
        game.user_id = user_id
        game.save
        render json: game
      end
    end
  end
end
