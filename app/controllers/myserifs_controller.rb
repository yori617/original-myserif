class MyserifsController < ApplicationController
  before_action :require_user_logged_in, except: [:index, :show]
  before_action :correct_user, only: [:destroy]
  
  def index
    @myserifs = Myserif.all.order(created_at: :desc)
  end
  
  def new
    @myserif = current_user.myserifs.build
  end

  def create
    @myserif = current_user.myserifs.build(myserif_params)
    if @myserif.save
      flash[:success] = 'セリフ記録を投稿しました。'
      redirect_to action: :index
    else
      flash.now[:danger] = 'セリフ記録の投稿に失敗しました。'
      render :new
    end
  end
  
  def edit
    @myserif = Myserif.find(params[:id])
    #if @myserif.user == current_user
      #render :edit
    #else
      #redirect_to myserif_path
    #end
  end
  
  def update
    @myserif = Myserif.find(params[:id])
    if @myserif.update_attributes(myserif_params)
      flash[:success] = '投稿を更新しました。'
      redirect_to myserif_path
    else
      flash.now[:danger] = '投稿の更新に失敗しました。'
      render :edit
    end   
  end
  
  def show
    @myserif = Myserif.find(params[:id])
    #@genre = Genre.find(params[:id])
  end

  def destroy
    @myserif = Myserif.find(params[:id]).destroy
    flash[:success] = 'セリフを削除しました。'
    redirect_to myserifs_path
  end
  
  private

  def myserif_params
    params.require(:myserif).permit(:content, :title, :character)
  end
  
  def correct_user
    @myserif = current_user.myserifs.find_by(id: params[:id])
    unless @myserif
      redirect_to root_url
    end
  end
end