class HomesController < ApplicationController
  def index
    @user = current_user
  end

  def show
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post_params = params.require(:post).permit(:title,:body)
    @post = Post.new post_params
    if @post.save
      redirect_to homes_path
    else
      render :new
    end
  end
end
