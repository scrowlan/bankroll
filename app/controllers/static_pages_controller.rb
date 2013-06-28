class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @roll = Roll.new
      @game = Game.new
    end
  end

  def help
  end
  
  def about
  end
  
end
