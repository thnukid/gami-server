require 'spec_helper'
require 'rails_helper'
require 'pry'

describe Gami::GamiGame do
  let(:options){{:gteq => 2, :using_property => ['commit']}}
  let(:opt_3){{:gteq => 3, :using_property => ['commit']}}
  let(:opt_4){{:gteq => 4, :using_property => ['commit']}}
  let(:block_3) {Gami::Predication.new.build(opt_3)}
  let(:block_4) {Gami::Predication.new.build(opt_4)}
  let(:bTrue){Gami::Predication.new.build(options)}
  let(:event){create :event}

  subject{described_class.new "Some Game", "git:push"}

  describe 'gami game' do
    context 'init' do
      it 'initializes' do
        expect(subject).to be_an_instance_of(described_class)
      end
      let(:sub_opt) {described_class.new "Some Game", "git:push", {:next_badges => 'show'}}
      it 'init with options' do
        expect(sub_opt.options).to include(:next_badges)
        binding.pry
      end
    end

    it 'contains rules' do
      subject.add_rule('desc','super badge', 'commit', options, &bTrue)
      subject.add_rule('desc','super badge', 'commiti', options, &bTrue)
      expect(subject.rules.size).to eq(2)
    end

    context 'runs a game' do
      before(:each){
        event.aggregate_properties(['commit'])
        event.aggregate_properties(['commit'])
        event.aggregate_properties(['commit'])
        subject.add_rule('desc','super badge', 'commit', options, &bTrue) # true = 2
        subject.add_rule('desc','super ye', 'commit', opt_4, &block_4) #true = 4
        subject.add_rule('desc','super x', 'commit', opt_3, &block_3) #true = 3
        subject.run(event)
      }

      it 'has results' do
        expect(subject.results.size).to eq(2)
        expect(Badge.count).to eq(2)
      end

     it 'has inactive badges' do
        binding.pry 
        expect(subject.next_badges.size).to eq(1) 
      end 
    end
  end
end
