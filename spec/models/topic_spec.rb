require 'rails_helper'

describe Topic do
  describe "scopes" do

    before do
      @public_topic = Topic.create #default is Public
      @private_topic = Topic.create(public: false)
    end

    describe "publicly_viewable" do
      it "returns a relation of all public topics" do
        expect(Topic.publicly_viewable).to eq( [@public_topic] )
      end
    end

    describe "privately_viewable" do
      it "returns a relation of all private topics" do
        expect(Topic.privately_viewable).to eq( [@private_topic] )
      end
    end

    describe "visible_to(user)" do
      it "returns all topics if the user is present" do
        user = User.new
        # Code here
      end

      it "returns only public topics if user is nil" do
        # Code here
      end
    end
  end
end
