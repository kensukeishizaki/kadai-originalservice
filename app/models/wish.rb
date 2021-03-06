class Wish < ApplicationRecord
  belongs_to :user
  belongs_to :attraction
  
  validates :user_id, presence: true
  validates :attraction_id, presence: true
  
  def self.ranking
    self.group(:attraction_id).order('count_attraction_id DESC').limit(10).count(:attraction_id)
  end
end
