class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @roll = current_user.rolls.build
    end
  end

  def help
  end
  
  def about
  end
  
end
