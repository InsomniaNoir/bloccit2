require 'rails_helper'

describe Post do
  describe "vote methods" do

    before do
      @user = User.create
      @topic = Topic.create
      @post = Post.create(title: 'post title', body: 'Post bodies must be pretty long.')
      3.times { @topic.post.votes.create(value: 1) }
      2.times { @topic.post.votes.create(value: -1) }
   end

   describe '#up_votes' do
     it "counts the number of votes with the value of 1" do
       expect( @topic.post.up_votes ).to_eq(3)
     end
   end

  describe '#down_votes' do
    it "counts the number of votes with the value of -1" do
      expect( @topic.post.down_votes ).to_eq(2)
    end
  end

  describe 'points' do
    it "returns the sum of all down and up votes" do
      expect( @topic.post.points ).to_eq( 1 )
      end
    end
  end
end
