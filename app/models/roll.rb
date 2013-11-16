class Roll < ActiveRecord::Base
  attr_accessible :amount, :site_name
  belongs_to :user
  has_many :games, dependent: :destroy
  
  validates :user_id, presence: true
  
  def tot_dif_by_game(id)
    self.total_difference_by_game = (Game.sum(:difference, :group => :roll_id)).fetch(id)
  end

  
  
  def tot_hours_by_game(id)
    self.total_hours_by_game = (Game.sum(:hours_played, :group => :roll_id)).fetch(id)
  end
  
  def updated_bankroll(id)
    @updated_bankroll = Roll.find_by_id(id).amount + @total_difference_by_game = (Game.sum(:difference, :group => :roll_id)).fetch(id)
  end

  def hourly_rate
    @total_hours_by_game = (Game.sum(:hours_played, :group => :roll_id)).fetch(id)
    @hourly = @total_difference_by_game / @total_hours_by_game
  end

end
