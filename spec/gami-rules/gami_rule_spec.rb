require 'spec_helper'

describe Gami::Game do
  subject{described_class}

  describe "should be a class"
    it "is an class" do
      expect(subject).to respond_to(:new)
    end

describe Gami::Rule do
  subject{described_class}

  describe "should be a class"
    it "is an class" do
      expect(subject).to respond_to(:new)
    end
end
