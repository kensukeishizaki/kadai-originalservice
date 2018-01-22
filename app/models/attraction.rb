class Attraction < ApplicationRecord
    has_many :wishes
    has_many :wish_users, through: :wishes, class_name: 'User', source: :user
    
    has_many :reviews
    has_many :review_users, through: :reviews, class_name: 'User', source: :user
end
