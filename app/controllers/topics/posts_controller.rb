class Topics::PostsController < ApplicationController
   def show
     @post = Post.find(params[:id])
     @comments = @post.comments
     @comment = Comment.new
     @topic = Topic.find(params[:topic_id])
     authorize @topic
   end

   def new
     @topic = Topic.find(params[:topic_id])
     @post = Post.new
     authorize @post
   end

   def edit
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:id])
     authorize @post
   end

   def create
     @topic = Topic.find(params[:topic_id])
     @post = current_user.posts.build(post_params)
     @post.topic = @topic
     authorize @post

     if @post.save
       @post.create_vote
       flash[:notice] = "Post was saved."
       redirect_to [@topic, @post]
     else
       flash[:error] = "ID-10-T error. Please try again."
       render :new
     end
   end

   def update
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:id])
     authorize @post

     if @post.update_attributes(post_params)
       flash[:notice] = "Post was updated."
       redirect_to [@topic, @post]
     else
       flash[:error] = "ID-10-T error. Please try again."
       render :edit
     end
   end

   def delete
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:id])
     authorize @post

     if @post.destroy
       flash[:notice] = "\"#{post.title}\" was deleted successfully."
       redirect_to @topic
     else
       flash[:error] = "There was an error deleting this post."
       render :show
     end
   end

 private

 def post_params
   params.require(:post).permit(:title, :body, :image, :image_cache)
 end
end
