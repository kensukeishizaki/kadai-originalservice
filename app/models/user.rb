class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }  
  
  has_secure_password
  
  has_many :wishes
  has_many :wish_attractions, through: :wishes, class_name: 'Attraction', source: :attraction
  
  has_many :reviews
  has_many :review_attractions, through: :reviews, class_name: 'Attraction', source: :attraction
  
  def wish(attraction)
    self.wishes.find_or_create_by(attraction_id: attraction.id)
  end
  
  def unwish(attraction)
    wish = self.wishes.find_by(attraction_id: attraction.id)
    wish.destroy if wish
  end
  
  def wish?(attraction)
    self.wish_attractions.include?(attraction)
  end
  
  def review(attraction)
    self.reviews.find_or_create_by(attraction_id: attraction.id)
  end
  
  def unreview(attraction)
    review = self.reviews.find_by(attraction_id: attraction.id)
    review.destroy if review
  end
  
  def review?(attraction)
    self.review_attractions.include?(attraction)
  end
end
