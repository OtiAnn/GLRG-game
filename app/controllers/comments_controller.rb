class CommentsController < ApplicationController
  def new
    @user = current_user
    @comment = Comment.new
  end

  def create
    @user = current_user
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

  private
    def comment_params
      params.require(:comment).permit(:body, :post_id, :user_id)
    end
end