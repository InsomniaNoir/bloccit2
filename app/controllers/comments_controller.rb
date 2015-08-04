class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Comment saved successfully."
    else
      flash[:error] = "Comment failed to save."
    end
    redirect_to [@post.topic, @post]
   end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
    end

    reespond_to do |format|
      format.html
      format.js
    end
  end

private

   def comment_params
     params.require(:comment).permit(:body)
   end
end
