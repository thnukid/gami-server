require 'spec_helper'
require 'rails_helper'

describe Gami::Rule do
  let(:options){{:gteq => 2, :using_property => ['commit']}}
  let(:bTrue){Gami::Predication.new.build(options)}
  subject{described_class.new('desc', 'My Badge', 'commit', options ,&bTrue)}
  describe 'rule' do
    it 'initializes' do
      expect(subject).to be_an_instance_of(described_class)
    end
    context 'validates a rule' do
      let(:event){create :event}
      it 'it applies false' do
        event.aggregate_properties(['commit'])
        expect(subject.applies?(event.user)).to be(false)
      end
      it 'it applies true' do
        event.aggregate_properties(['commit'])
        event.aggregate_properties(['commit'])
        expect(subject.applies?(event.user)).to be(true)
      end
    end
  end
end
