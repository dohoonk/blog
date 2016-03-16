class CommentsController < ApplicationController
  def create
    find_posts
    comments_params = params.require(:comment).permit(:body,:post_id,:user_id)
    @comment = Comment.new comments_params
    @comment.post_id = @post.id
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html {redirect_to post_path(@post)}
        format.js {render :create_success}
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if current_user.id == @comment.user_id
        find_posts
        @comment.destroy
        format.html {redirect_to post_path(@post)}
        format.js {render}
      else
        format.html {redirect_to root_path, notice: "Unathorized!!!!"}
      end
    end
  end

  private

  def find_posts
    @post = Post.friendly.find(params[:post_id])
  end
end
