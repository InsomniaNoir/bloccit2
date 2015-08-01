require 'rails_helper'

<<<<<<< Updated upstream
 describe Vote do
   describe "validations" do
     describe "value validation" do
       it "only allows -1 or 1 as values" do
         up_vote = Vote.new(value: 1)
         expect(up_vote.valid?).to eq(true)

         down_vote = Vote.new(value: -1)
         expect(down_vote.valid?).to eq(true)

         invalid_vote = Vote.new(value: 2)
         expect(invalid_vote.valid?).to eq(false)
       end
     end
   end

   describe 'after_save' do
     it "calls `Post#update_rank` after save" do
       @post = associated_post
       vote = Vote.new(value: 1, post: @post)
       expect(@post).to receive(:update_rank)
       vote.save
     end
   end

   def associated_post(options = {})
     post_options = {
       title: 'Post title',
       body: 'Post bodies must be pretty long',
       topic: Topic.create(name: 'Topic name'),
       user: @user
     }.merge(options)

     Post.create(post_options)
   end

 end
=======
RSpec.describe Vote, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
>>>>>>> Stashed changes
