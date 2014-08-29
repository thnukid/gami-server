require 'rails_helper'

RSpec.describe Event, :type => :model do
  it { should belong_to(:user)}

  describe "model validation" do
    it {should validate_presence_of(:user)}
    it {should validate_presence_of(:name)}
  end

  describe '#create_event_from_data' do


    let(:email) { 'glockenbeat@kabisa.nl' }
    let(:user) { create :user }
    let!(:alias) { create :alias, user: user, email: email }
    subject { Event.create_event_from_data(data) }

    context 'email found' do

      let(:data) {{ email: email, data: '1234', name: 'commit' }}
      it { expect(subject.user).to eql(user) }
      it { expect(subject).to be_kind_of(Event) }
      it { expect{subject}.to change{Event.count}.from(0).to(1) }

    end

    context 'email not found' do
      let(:data) {{ email: 'glockenbeat@ali.de', data: '1234', name: 'commit' }}
      it {expect(subject).to eql(nil)}
    end
  end


  describe 'Routing' do
   it { should route(:post, 'api/events').to('events#create') }
  end
end
