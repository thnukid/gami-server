require 'spec_helper'
require 'pry'

describe Gami::GamiGame do
  let(:description) {"Challenge in git commits. Who commits most?"}
  let(:event) {"git:commit"}
  let(:user) {1}

  let(:block_false){Proc.new {false}}
  let(:block_true){Proc.new {true}}
  let(:rule){Gami::Rule.new("test","test",&block_false)}

  subject{described_class.new(description, event, user)}

  describe "#new" do
    it "initializes correctly with params" do
      expect(subject).to be_instance_of described_class
    end
  end

  describe "Rules" do 
    before{
      subject.add_rule("sth", "sth", "sth", &block_false)
      subject.add_rule("sth", "sth", "sth", &block_true)
    }
    it "adds rule to the game" do
      expect(subject.rules.count).to eql(2)
    end

    xit "validates the rule, adds true ones to results" do
      subject.validate_rules
      expect(subject.results.count).to eql(1)
    end
  end
end
