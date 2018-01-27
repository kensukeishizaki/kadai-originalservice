class RankingsController < ApplicationController
  def wish
    @ranking_counts = Wish.ranking
    @attractions = Attraction.find(@ranking_counts.keys)
  end
end
