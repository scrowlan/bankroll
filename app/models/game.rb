class Game < ActiveRecord::Base
  attr_accessible :buy_in, :cash_out, :difference
  belongs_to :user
  belongs_to :roll
  before_create :calculate_difference
  # before_create :calculate_new_bankroll
  
  validates :user_id, presence: true
  
  private
  
  def calculate_difference
    self.difference = cash_out.to_f - buy_in.to_f
  end
  
  # def calculate_new_bankroll
  #   roll = roll + cash_out.to_f - buy_in.to_f
  # end
  
end
