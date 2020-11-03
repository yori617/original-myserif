class CommentsController < ApplicationController
    
  def create
    #@myserif = Myserif.find(params[:myserif_id])
    #@comment = @myserif.comments.build(comment_params)
    @comment = current_user.comments.build(comment_params)
    if @comment.save
        flash[:secondary] = "コメントしました。"
        redirect_back(fallback_location: @myserif)
    else
        flash[:secondary] = "コメントできませんでした。"
        redirect_back(fallback_location: @myserif)
    end
  end

  def destroy
    #投稿(myserif)の情報を取得
    #@myserif = Myserif.find(params[:myserif_id])
    # その記事内の削除対象のコメントを探して取得
    #@comment = @myserif.comments.find(params[:id])
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
      redirect_back(fallback_location: @myserif)
  end

  private
  
    def comment_params
      params.require(:comment).permit(:content).merge(myserif_id: params[:myserif_id])
    end
end