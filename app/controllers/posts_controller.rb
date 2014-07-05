class PostsController < ApplicationController
  def index
    @user = current_user
  end
  def show
    @user = current_user
    @post = Post.find(params[:id])
    @comments = @post.comments.all
    @comment = @post.comments.build
  end
  def new
    @user = current_user
    @post = Post.new
  end
  def create
    @user = current_user
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: '文章儲存成功！' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  def edit
    @user = current_user
    @post = Post.find(params[:id])
  end
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: '文章更新成功！' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: '文章刪除成功！' }
      format.json { head :no_content }
    end
  end

  def find_mate
    @user = current_user
    @stuffs = @user.stuffs
  end

  private

  def post_params
      params.require(:post).permit(:title, :picture)
  end
end