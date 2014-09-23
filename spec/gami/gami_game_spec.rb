require 'spec_helper'

describe Gami::GamiGame do
  let(:description) {"Challenge in git commits. Who commits most?"}
  let(:event) {"git:commit"}
  let(:user) {1}

  let(:block_false){Proc.new { false}}
  let(:rule){Gami::Rule.new("test","test",&block_false)}

  subject{described_class.new(description, event, user)}

  describe "#new" do
    it "initializes correctly with params" do
      expect(subject).to be_instance_of described_class
    end
  end

  context "Rule handeling" do
    before{
      subject.rule("test","test",&block_false)
    }

    describe "rule array" do
      it "add a rule to an arry" do
        expect(subject.rules).to include(Gami::Rule)
      end
    end
  end
end
