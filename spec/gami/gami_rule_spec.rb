require 'spec_helper'

describe Gami::Rule do
  let(:description) {"You want to play a game?"}
  let(:badge) {"rookie"}
  let(:block_false){Proc.new { false }}
  let(:block_true){Proc.new { true }}

  subject{described_class.new(description, badge, &block_false)}

  describe "#new" do
    it "initializes correctly with params" do
     expect(subject).to be_instance_of described_class
    end
  end

  context "return attribute" do

  describe "#description" do
    it "returns the attr" do
      expect(subject.description).to eq description 
    end
  end

  describe "#badge" do
    it "returns the attr" do
      expect(subject.badge).to eq badge
    end
  end

  describe "#block" do
    it "returns the attr" do
      expect(subject.block).to eq block_false
    end
  end

  end

  describe "#applies?" do
    context "block validates to false" do
      it "validates false" do
        expect(subject.applies?).to be(false)
      end
    end

    context "block validates to true" do
      before {subject.instance_variable_set(:@block, block_true)}
      it "validates false" do
        expect(subject.applies?).to be(true)
      end
    end
  end
end
