require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        up_vote = Vote.new(value: 1)
        down_vote = Vote.new(value: -1)

        expect(up_vote.valid?).to eq(true)
        expect(down_vote.valid?).to eq(true)
      end
    end
  end
end
