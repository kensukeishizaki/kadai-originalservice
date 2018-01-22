class WishesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    attraction = Attraction.find(params[:attraction_id])
    current_user.wish(attraction)
    flash[:success] = '「行きたい」リストに追加しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    attraction = Attraction.find(params[:attraction_id])
    current_user.unwish(attraction)
    flash[:success] = '「行きたい」リストから削除しました。'
    redirect_back(fallback_location: root_path)
  end
end
