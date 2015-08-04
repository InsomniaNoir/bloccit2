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

  describe ".top-rated" do

    before do
      @user1 = create(:user_with_post_and_comment)
      @user2 = create(:user_with_post_and_comment)
    end

    it "returns users ordered by comments + posts" do
      expect( User.top_rated ).to eq([@user1, @user2])
    end

    it "stores a 'post_count' on user" do
      users = User.top_rated
      expect( users.first.posts_count ).to eq(1)
    end
  end
