class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to [@post], notice: "Comment saved successfully."
    else
      redirect_to [@post], notice: "Comment failed to save."
    end
   end


private

   def comment_params
     params.require(:comment).permit(:body)
   end
end
