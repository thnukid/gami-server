require 'spec_helper'
require 'rails_helper'
require 'pry'
describe Gami::GamiBadge do
  let(:user){User.first}
  let(:attr){
    {:name => 'name', :description => 'desc',
     :picture => Gami::GamiImg2css.translateImg('junior') , :user => user}
  }
  subject{described_class.new(user,rule)}

  describe "badge" do
    it 'creates a new badge' do
      Badge.create(attr)
      expect(user.badges.count).to eql(1)
      expect(user.badges.first.picture).to match("fa-graduation-cap")
    end
    it 'has following attr' do
      #let(:badge) {user.badges.first}
      binding.pry
    end
  end
end
