class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.post, notice: '你的回應儲存成功！' }
      else
        format.html { redirect_to @comment.post, notice: '你的回應儲存失敗！' }
      end
    end
  end

  def user_score
    @user = User.find(params[:id])
    @user.score += 1
    @user.update(params.permit(:score))
    redirect_to request.referer
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :post_id, :user_id)
    end
end