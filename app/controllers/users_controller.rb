class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:destroy, :edit, :update, :likes]
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @myserifs = @user.myserifs.order(created_at: :desc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = '登録完了です。ようこそ。'
      redirect_to @user
    else
      flash.now[:danger] = '登録失敗。もう一度試してみましょう。'
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'ユーザ情報を更新しました。'
      render :edit
    else
      flash.now[:danger] = 'ユーザー情報の更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:dark] = '退会完了しました。いつでも帰ってきてください。'
    redirect_to root_url
  end
  
  def likes
    @user = User.find(params[:id])
    @likes = @user.likes.page(params[:page])
    #counts(@user)
  end
  
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end