class Game < ActiveRecord::Base
  attr_accessible :buy_in, :cash_out, :difference, :roll_id, :hours_played, :date_played, :m_played, :h_played, :amount
  attr_accessor :m_played, :h_played
  belongs_to :user
  belongs_to :roll
  before_create :calculate_difference, :update_hours_played, :calculate_hourly_rate
  before_update :calculate_difference, :update_hours_played, :calculate_hourly_rate
  
  validates :user_id, presence: true

  def calculate_difference
    self.difference = cash_out.to_f - buy_in.to_f
  end
    
  def update_hours_played
    self.hours_played = @m_played.to_f / 60 + @h_played.to_f
  end
  
  def calculate_hourly_rate
    self.amount = self.difference / self.hours_played
  end
  
end
