class RankingsController < ApplicationController
  def review
    @ranking_averages = Review.rate.ranking
    @attractions = Attraction.find(@ranking_averages.keys)
  end
end
