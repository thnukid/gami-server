require 'spec_helper'

describe Gami::GamiBadge do
  let(:user){1}
  let(:rule){Gami::Rule.new "sth","sth" do Proc.new{true} end}

  subject{described_class.new(user,rule)}

  describe "badge" do
    it "returns a hash" do
      expect(subject.info).to include(:name => rule.badge, :description => rule.description, :picture => "http://placekitten.com/g/164/164", :user => user)
    end
  end
end
