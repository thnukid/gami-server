require 'spec_helper'
require 'rails_helper'

describe Gami::GamiAssets do

  subject{Gami::GamiAssets.new(Rails.root + 'spec/fixtures/assets/*.json') }

  describe 'assets' do
    it 'contains a pathname' do
      expect(subject.assets_path).to be_instance_of(Pathname)
    end
    it 'load many badges' do
      expect(subject.badges.size).to eql(4)
    end
  end

  describe 'finding assets' do
    it 'translates correctly' do
      expect(subject.find_badge('badge1')).to eql('badge_css_1')
      expect(subject.find_badge('badge 1 alt')).to eql('badge_css_1')
    end
    it 'cant find return name of badge' do
      expect(subject.find_badge('abc cd')).to eql('abc cd')
      expect(subject.find_badge('abc1cd')).to eql('abc1cd')

    end
  end
end
