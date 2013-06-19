class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @roll = Roll.new
      @game = Game.new
      @total_difference_by_game = Game.sum(:difference, :group => :roll_id)
    end
  end

  def help
  end
  
  def about
  end
  
end
