class PostsController < ApplicationController
  def index

  end
  def show

  end
  def new
  end
  def create
  end
  def edit
  end
  def update
  end
  def destroy
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