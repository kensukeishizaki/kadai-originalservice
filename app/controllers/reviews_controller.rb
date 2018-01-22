class ReviewsController < ApplicationController
before_action :require_user_logged_in, only: [:create, :update, :destroy]
   #def new
     #@review = Review.new
   #end

  def create
    @review = current_user.reviews.build(new_review_params)
    
    if @review.save!
      flash[:success] = "投稿されました。"
      redirect_back(fallback_location: root_path)
      
    else
      flash[:danger] = "投稿できませんでした。"
      redirect_back(fallback_location: root_path)
    end
  end

  # def edit
  #   @review = Review.find(params[:id])
  # end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:success] = "投稿されました。"
      redirect_back(fallback_location: root_path)
      
    else
      flash[:danger] = "投稿できませんでした。"
      redirect_back(fallback_location: root_path)
    end  
  end

  def destroy
    @review = Review.find(params[:id])

    @review.destroy
    
    flash[:success] = '削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def review_params
    params.require(:review).permit(:comment, :rate)
  end
  
  def new_review_params
    params.require(:review).permit(:comment, :rate, :attraction_id)
  end
end  
