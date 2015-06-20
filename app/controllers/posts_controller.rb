class PostsController < ApplicationController
  def index
    @posts = policy_scope(Post)
  end

  def show
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    authorize @post
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.new(params.require(:post).permit(:title, :body))
      authorize @post
      if @post.save
        flash[:notice] = "Post was saved!"
      else
        flash[:error] = "ID-10-T error. Please try again."
        render :new
      end
   end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:id])
     authorize @post
     if @post.update_attributes(params.require(:post).permit(:title, :body))
       flash[:notice] = "Post was updated."
       redirect_to @post
     else
       flash[:error] = "ID-10-T error. Please try again."
       render :edit
     end
   end
 end
