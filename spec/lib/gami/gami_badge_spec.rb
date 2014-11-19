require 'spec_helper'
require 'rails_helper'

describe Gami::GamiBadge do
  let(:badge_css) {Gami::GamiAssets.new(Rails.root + 'spec/fixtures/assets/*.json').find_badge('badge 1')}
  let(:block) {Proc.new{true}}
  let(:rule) {Gami::Rule.new 'label','Super Awesome Badge','commits_count', '', &block }
  let(:valid_result){
    {:name => 'Super Awesome Badge', :description => 'label', :picture => 'Super Awesome Badge' ,:user => User.first}
  }

  describe 'badge creation' do
    subject{Gami::GamiBadge.new(User.first, rule)}
    it 'has the expected attributes' do
      expect(subject.attributes).to eql(valid_result)
    end
    it 'adds a badge with valid data' do
      Badge.create subject.attributes
      expect(Badge.count).to eql(1)
    end
  end
end
