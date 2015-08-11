class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments

    @comment = Comment.new( comment_params )
    @comment.user = current_user
    @comment.post = @post
    @new_comment = Comment.new

    authorize @comment

    if @comment.save
      flash[:notice] = "Comment saved successfully."
    else
      flash[:error] = "Comment failed to save."
    end

    respond_to do |format|
      format.html
      format.js
      end
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

    respond_to do |format|
      format.html
      format.js
    end
  end

private

   def comment_params
     params.require(:comment).permit(:body)
   end
end
