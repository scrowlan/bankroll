class Roll < ActiveRecord::Base
  attr_accessible :amount
  belongs_to :user
  has_many :games
  
  validates :user_id, presence: true
  
  def game_difference
    games.difference
  end
  
  
  
end
