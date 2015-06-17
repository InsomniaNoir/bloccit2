class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :body))
      if @post.save
        flash[:notice] = "Post was saved!"
      else
        flash[:error] = "ID-10-T error. Please try again."
        render :new
      end
   end

  def edit
  end
end
