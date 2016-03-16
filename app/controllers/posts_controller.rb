class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post_params = params.require(:post).permit([:title, :body, :category, :user_id])
    @post = Post.new post_params
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.new
    @favourite = @post.favourite_for(current_user)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if current_user == @post.user
      post_params = params.require(:post).permit(:title,:body)
      if @post.update post_params
        redirect_to post_path(@post)
      else
        render :edit
        end
    else
        redirect_to root_path, notice: "Get the fuck out Tom"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def search
    @posts = Post.search(params[:p])
    render :index
  end

end
