class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :sorted_posts, only: [:new, :edit]

  def index

  end

  def show
    if @post.blank?
      redirect_to posts_path
    else
      @comments = @post.comments.all
      @comment = @post.comments.build
      @sorted_users = User.all.sorted_by_score
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: '題目儲存成功！' }
      else
        format.html { render :new }
      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: '題目更新成功！' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: '題目刪除成功！' }
    end
  end

  def find_mate
    if current_user.present?
      @user = current_user
      @stuffs = @user.stuffs
    end
  end

  private

  def sorted_posts
      @sorted_posts = Post.all.sorted_by_post_id
  end

  def set_post
      @post = Post.find_by_id(params[:id])
  end

  def post_params
      params.require(:post).permit(:title, :picture)
  end
end
