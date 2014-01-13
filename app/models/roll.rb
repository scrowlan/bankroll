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

  def tot_buy_in(id)
    self.total_buy_in = (Game.sum(:buy_in, :group => :roll_id)).fetch(id)
  end

  def tot_cash_out(id)
    self.total_cash_out = (Game.sum(:cash_out, :group => :roll_id)).fetch(id)
  end

  def updated_bankroll(id)
    @updated_bankroll = Roll.find_by_id(id).amount + @total_difference_by_game = (Game.sum(:difference, :group => :roll_id)).fetch(id)
  end

  def hourly_rate
    @total_hours_by_game = (Game.sum(:hours_played, :group => :roll_id)).fetch(id)
    @hourly = @total_difference_by_game / @total_hours_by_game
  end

  def roi_by_game
    @total_buy_in = (Game.sum(:buy_in, :group => :roll_id)).fetch(id)
    @total_cash_out = (Game.sum(:cash_out, :group => :roll_id)).fetch(id)
    @roi = ((@total_cash_out - @total_buy_in) / @total_buy_in) * 100
  end

end
