require 'spec_helper'

describe Gami::Game do
  subject{described_class}

  describe "should be a class"
    it "is an class" do
      expect(subject).to respond_to(:new)
    end

    it "has an array of rules" do
      expect(subject).to respond_to(:conditions=)
    end
  end

describe Gami::Rule do
  subject{described_class}

  describe "should be a class"
    it "is an class" do
      expect(subject).to respond_to(:new)
    end
    it "has an initialize method with 1 argument" do
      expect(subject.new("git")).to be_a(subject)
    end
  describe "add rule"
    it "add a rule to the array list" do
        subject.
    end
  describe "attributes accessible"
    xit "uses attr_accessor: condition" do
      #expect(subject).to respond_to(:condition=).with(0).arguments
      expect(subject).to respond_to(:condition=)
      #subject.condition = 'git'
    end
end
