class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @post, notice: "Comment saved successfully."
    else
      redirect_to @post, notice: "Comment failed to save."
    end
   end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was deleted"
      redirect_to @post
    else
      flash[:error] = "Comment couldn't be deleted. Please try again."
      redirect_to @post
    end
  end

private

   def comment_params
     params.require(:comment).permit(:body)
   end
end
