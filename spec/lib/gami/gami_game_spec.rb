require 'spec_helper'
require 'rails_helper'

describe Gami::GamiGame do
  let(:options){{:gteq => 2, :using_property => ['commit']}}
  let(:bTrue){Gami::Predication.new.build(options)}
  let(:event){create :event}

  subject{described_class.new("Some Game", 'git:push')}

  describe 'gami game' do
    it 'initializes' do
      expect(subject).to be_an_instance_of(described_class)
    end

    it 'contains rules' do
      subject.add_rule('desc','super badge', 'commit', options, &bTrue)
      subject.add_rule('desc','super badge', 'commiti', options, &bTrue)
      expect(subject.rules.size).to eq(2)
    end

    context 'runs a game' do

      it 'has no results' do
        event.aggregate_properties(['commit'])
        subject.run(event)
        expect(subject.results.size).to eq(0) 
      end

      it 'has results' do
        event.aggregate_properties(['commit'])
        event.aggregate_properties(['commit'])
        subject.add_rule('desc','super badge', 'commit', options, &bTrue)
        subject.run(event)

        expect(subject.results.size).to eq(1)
        expect(Badge.count).to eq(1)
      end
    end
  end
end
