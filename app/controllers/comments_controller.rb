class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to [@post.topic, @post], notice: "Comment saved successfully."
    else
      redirect_to [@post.topic, @post], notice: "Comment failed to save."
    end
   end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if comment.destroy
      flash[:notice] = "Comment was deleted"
      redirect_to [@topic, @post]
    else
      flash[:error] = "Comment couldn't be deleted. Please try again."
      redirect_to [@topic, @post]
    end
  end


private

   def comment_params
     params.require(:comment).permit(:body)
   end
end
