require 'rails_helper'

RSpec.describe Alias, :type => :model do

  describe 'model relations' do
    it { should belong_to(:user) }
  end

  describe 'model validation' do

    describe "email validation" do
      it { should validate_presence_of(:username) }
    end

    describe "username validation" do
      it { should validate_presence_of(:username) }
      it { should validate_presence_of(:user) }
    end

  end


end
