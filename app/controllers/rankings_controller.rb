class RankingsController < ApplicationController
  def wish
    #@ranking_counts = Wish.ranking
    #@attractions = Attraction.find(@ranking_counts.keys)
  end
  
  def review
    @ranking_average = Review.ranking
    @attractions = Attraction.find(@ranking_average.keys)
  end  
end
