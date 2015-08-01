class FavoritesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)

    authorize favorite
    if favorite.save
      flash[:notice] = "This has been added to your favorites."
    else
      flash[:error] = "Something isn't stirring the kool-aid. Please try again."
    end
    redirect_to [post.topic, post]
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])

    authorize favorite
    if favorite.destroy
      flash[:notice] = "This is no longer your favorite :("
    else
      flash[:error] = "Despite your best efforts this is still your favorite. Try again."
    end
    redirect_to [post.topic, post]
  end
end
