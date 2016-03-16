class FavouritesController < ApplicationController
  def create
    @favourite = Favourite.new
    @favourite.user_id = current_user.id
    find_posts
    @favourite.post_id = @post.id
    respond_to do |format|
      if @favourite.save
        format.html {redirect_to post_path(@post), alert: "Added to favourite"}
        format.js {render :create_success}
      else
        format.html {redirect_to post_path(@post), alert: "Cant be added to favourite"}
      end
    end
  end

  def destroy
    find_posts
    @favourite = @post.favourites.find_by_user_id current_user
    @favourite.destroy
    respond_to do |format|
      format.html {redirect_to post_path(@post), alert: "Removed from the favourite list"}
      format.js {render}
    end
  end

  private

  def find_posts
    @post = Post.friendly.find(params[:post_id])
  end
end
