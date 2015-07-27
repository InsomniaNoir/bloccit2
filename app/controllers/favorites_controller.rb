class FavoritesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)

    authorize favorite
    if favorite.save
      flash[:notice] = "This has been added to your favorites."
      redirect_to [post.topic, post]
    else
      flash[:error] = "Something isn't stirring the kool-aid. Please try again."
      redirect_to post
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = Post.find(current_user.favorite(:post_id))

    authorize favorite
    if favorite.destroy
      flash[:notice] = "This is no longer your favorite :("
      redirect_to @post
    else
      flash[:error] = "Despite your best efforts this is still your favorite. Try again."
      redirect_to @post
    end
  end
end
