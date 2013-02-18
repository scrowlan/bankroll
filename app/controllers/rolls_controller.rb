class RollsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user, only: :destroy
  
  def create
    @roll = current_user.rolls.build(params[:roll])
    if @roll.save
      flash[:success] = "Bankroll Created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end
  
  def destroy
    @roll.destroy
    redirect_to root_url
  end
  
  private
  
  def correct_user
    @roll = current_user.rolls.find_by_id(params[:id])
    redirect_to root_url if @roll.nil?
  end
end
