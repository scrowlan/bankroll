class Game < ActiveRecord::Base
  attr_accessible :amount
  belongs_to :user
  
  validates :user_id, presence: true
end
