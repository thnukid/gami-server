require 'rails_helper'

RSpec.describe User, :type => :model do

  describe 'model relations' do
    it { should have_many(:aliases) }
    it { should have_many(:events) }
    it { should have_many(:badges) }
  end

  describe 'model validation' do

    subject { build(:user)}

    describe 'username validation' do
      it {should validate_presence_of(:username) }
      it {should validate_uniqueness_of(:username)}
    end

    describe 'email validation' do
      it {should validate_presence_of(:email) }
      it {should validate_uniqueness_of(:username)}
    end

    describe 'password validation' do
      it {should validate_presence_of(:password_digest) }
      it {should ensure_length_of(:password_digest).is_at_least(8) }
    end

  end
end
