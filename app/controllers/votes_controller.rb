class VotesController < ApplicationController
  before_action :load_post_and_vote

  def up_vote

    redirect_to :back

    private

    def load_post_and_vote
      @post = Post.find(params[:post_id])

      @vote = @post.where(user_id: current_user_id).first
    end

    def update_vote!(new_value)
      if @vote
        authorize @vote, :update?
        @vote.update_attribute(:value, 1)
      else
        @vote.current_user.votes.build(value: 1, post: @post)
        authorize @vote, :create?
        @vote.save
      end
    end

    end
  end
end
