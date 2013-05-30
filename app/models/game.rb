class Game < ActiveRecord::Base
  attr_accessible :buy_in, :cash_out, :difference, :roll_id
  belongs_to :user
  belongs_to :roll
  before_create :calculate_difference
  
  validates :user_id, presence: true
  
  def total_difference
    Game.calculate(:sum, :difference)
  end
  
  def calculate_difference
    self.difference = cash_out.to_f - buy_in.to_f
  end
end
