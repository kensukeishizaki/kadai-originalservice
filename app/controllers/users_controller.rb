class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show]
  
  def show
    @user = User.find(params[:id])
    @attractions = @user.wish_attractions
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザーの登録が完了しました。'
      redirect_to root_url
      
    else
      flash.now[:danger] = 'ユーザーの登録に失敗しました。'
      render :new
    end  
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmaion)
  end  
  
end
