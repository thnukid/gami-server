require 'rails_helper'
require 'spec_helper'

describe Gami::GamiEngine do

  describe 'loading gami game' do
    subject{Gami::GamiEngine.new(Rails.root + 'spec/fixtures/dsl/*.gami') }

    describe 'engine' do
      it 'has many games' do
        expect(subject.games.size).to eql(1)
      end
      describe 'game' do
        it 'has many rules' do
          expect(subject.games.first.rules.size).to eql(7)
        end
        it 'has many properties to aggregate' do
          expect(subject.games.first.properties.size).to eql(1)
        end
      end
    end

    let(:event) {create :event, user: User.first}

    describe 'aggreation' do
      it 'aggregates all the properties of the loaded games' do
        subject.aggregate_properties(event)
        expect(Fact.where(aggregated_fact_name: 'commit', user: event.user).first.value).to eql(1)
      end
   end
    describe 'badge creation' do
      it 'adds badges when running the engine' do
        subject.run(event)
        expect(event.user.badges.count).to eql(1)
      end
      it 'runs' do
        Gami::GamiEngine.new(Rails.root + 'spec/fixtures/dsl/*.gami').run(event)
        Gami::GamiEngine.new(Rails.root + 'spec/fixtures/dsl/*.gami').run(event)
        Gami::GamiEngine.new(Rails.root + 'spec/fixtures/dsl/*.gami').run(event)
        expect(event.user.badges.count).to eql(2)
      end
    end

  end

end
