require 'rails_helper'

RSpec.describe Fact, :type => :model do
  it {should belong_to(:user)}

  describe "model validation" do
    it {should validate_presence_of(:user)}
    it {should validate_presence_of(:aggregated_fact_name)}
    it {should validate_presence_of(:value)}
    it { should validate_uniqueness_of(:aggregated_fact_name) }
  end
  describe "#aggregate_for_user" do

    let(:user) {create :user}
    let(:fact){ "git_commit_count"}
    let(:value) {10}

    subject {Fact.aggregate_for_user(user,fact,value)}

    context "valid user" do
      describe "adding a fact" do
        it{expect(subject.value).to eql(10)}
        it{expect(subject).to be_kind_of(Fact)}
        it{expect{subject}.to change{Fact.count}.from(0).to(1) }
      end
    end

    context "fact exists, increment value by 1" do
      before {
        Fact.aggregate_for_user(user,"c",1)
        Fact.aggregate_for_user(user,"c",1)
      }

      let(:two_facts){Fact.where(aggregated_fact_name: "c", user: user).first}

      it{expect(two_facts.value).to eql(2)}
    end
  end
end
