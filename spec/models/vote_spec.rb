
require 'spec_helper'


describe Vote do

  vote = Vote.new
  describe "validations" do
    describe "value validations" do
      it "allows -1 or 1 as values" do
      expect(vote).to_eq( 1, -1 )

      end
    end
  end
end
