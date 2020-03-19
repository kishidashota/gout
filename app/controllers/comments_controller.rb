class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html { redirect_to post_path(params[:post_id])  }
      format.json
    end  
  end
  # ローカル変数commentは、スコープの関係でこの後のjbuilder側で使用できないので、インスタンス変数@commentに編集します。

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
