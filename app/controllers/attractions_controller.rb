class AttractionsController < ApplicationController
  before_action :correct_admin_user, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @attractions = Attraction.order("themepark_id").page(params[:page]).per(10)
  end

  def show
    @attraction = Attraction.find(params[:id])
    if logged_in?
      @review = current_user.reviews.find_by(attraction_id: @attraction.id) || Review.new
    end
    @wish_users = @attraction.wish_users
    @review_users = @attraction.review_users
  end
  
  def new
    @attraction = Attraction.new
  end
  
  def create
    @attraction = Attraction.new(attraction_params)

    if @attraction.save
      flash[:success] = '正常に投稿されました'
      redirect_to @attraction
    else
      flash.now[:danger] = '投稿されませんでした'
      render :new
    end      
  end
  
  def edit
    @attraction = Attraction.find(params[:id])
  end
  
  def update
    @attraction = Attraction.find(params[:id])
    
    if @attraction.update(attraction_params)
      flash[:success] = '正常に投稿されました'
      redirect_to @attraction
    else
      flash.now[:danger] = '投稿されませんでした'
      render :new
    end      
  end  
  
  def destroy
    @attraction = Attraction.find(params[:id])

    @attraction.destroy
    
    flash[:success] = 'アトラクションは正常に削除されました'
    redirect_to attractions_path    
  end  
  
  private
  
  def attraction_params
    params.require(:attraction).permit(:name, :content, :themepark_id)
  end
  
  def correct_admin_user
    redirect_to root_path if !admin?
  end
end
