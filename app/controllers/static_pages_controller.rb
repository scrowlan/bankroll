class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @roll = current_user.rolls.build
      @game = current_user.games.build
    end
  end

  def help
  end
  
  def about
  end
  
end
