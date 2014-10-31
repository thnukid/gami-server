require 'rails_helper'
require 'spec_helper'

describe Gami::GamiEngine do

  describe 'loading gami game' do
    subject{Gami::GamiEngine.new}

    describe 'engine' do
      it 'has many games' do
        expect(subject.games.size).to eql(2)
      end
      describe 'game' do
        it 'has many rules' do
          expect(subject.games.first.rules.size).to eql(2)
        end
        it 'has many properties to aggregate' do
          expect(subject.games.first.properties.size).to eql(1)
        end
      end
    end

    describe 'aggreation' do
      let(:event) {create :event}
      it 'aggregates all the properties of the loaded games' do
        subject.aggregate_properties(event)
        expect(Fact.where(aggregated_fact_name: 'commits_count').first.value).to eql(1)
      end
    end
    describe 'badge creation' do
      let(:user) {create :user}
      let(:event) {create :event, user: user}
      it 'adds badges when running the engine' do
        subject.games.last.run
        expect(subject.games.last.results).to eql(2)
      end
    end

  end

end
