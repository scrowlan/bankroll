class Roll < ActiveRecord::Base
  attr_accessible :amount, :site_name
  belongs_to :user
  has_many :games
  
  validates :user_id, presence: true
  
  def tot_dif_by_game(id)
    @total_difference_by_game = (Game.sum(:difference, :group => :roll_id)).fetch(id) { |roll_id, value| puts "#{value}" } 
  end
  
  def tot_hours_by_game(id)
    @total_hours_by_game = (Game.sum(:hours_played, :group => :roll_id)).fetch(id) { |roll_id, value| puts "#{value}" }  
  end

  def hourly_rate
    @hourly = @total_difference_by_game / @total_hours_by_game
  end

end
