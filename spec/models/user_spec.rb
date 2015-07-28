require 'rails_helper'

describe User do

  include TestFactories

  before do
    @post = associated_post
    @user = authenticated_user
  end

  describe "#favorited(post)" do
    it "returns 'nil' if the user has not favorited the post" do
      expect(@user.favorited(@post)).to be_nil
    end

    it "returns the appropriate favorite if it exists" do
      @user.favorites.create(post: @post)
      favorite = @user.favorites.find_by_post_id(@post.id)
      expect(@user.favorited(@post)).to eq(favorite)
    end
  end
end
