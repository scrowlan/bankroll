class Roll < ActiveRecord::Base
  attr_accessible :amount, :site_name
  belongs_to :user
  has_many :games
  
  validates :user_id, presence: true
  
end
