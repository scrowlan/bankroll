class GamesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user, only: :destroy
  
  def list
    @games = Game.find(params[:id])
  end
  
  def index
    @games = Game.find(params[:id])
  end
  
  def show
    @game = Game.find(params[:id])
  end 

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update_attributes params[:game]
      flash[:success] = "Game Updated!"
      redirect_to root_url
    else
      render 'edit'
    end
  end
  
  def create
    @game = current_user.games.build(params[:game])
    if @game.save
      flash[:success] = "Game Created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @game.destroy
    redirect_to root_url
  end
  
  private
  
  def correct_user
    @game = current_user.games.find_by_id(params[:id])
    redirect_to root_url if @game.nil?
  end
end
