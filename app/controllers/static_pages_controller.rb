class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @roll = Roll.new
      @game = Game.new
      @total_difference = Game.calculate(:sum, :difference)
    end
  end

  def help
  end
  
  def about
  end
  
end
