class FavoritesController < ApplicationController
    before_action :require_user_logged_in
  
  def create
    myserif = Myserif.find(params[:myserif_id])
    current_user.favorite(myserif)
    flash[:secondary] = 'お気に入り追加しました。'
    redirect_to myserif_path(myserif)
  end

  def destroy
    myserif = Myserif.find(params[:myserif_id])
    current_user.unfavorite(myserif)
    flash[:secondary] = 'お気に入りを解除しました。'
    redirect_to myserif_path(myserif)
  end
end
