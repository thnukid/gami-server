require 'spec_helper'

describe Gami::GamiImg2css do
  let(:valid_icon){'<span class=\"fa-stack fa-5x\"><i class=\"fa fa-square-o fa-stack-2x\"></i><i class=\"fa fa-twitter fa-stack-1x\"></i></span>'}
  subject{described_class}

  describe 'translating badge to css' do
    it "returns for a specific badge css" do
      expect(subject.create_b("twitter")).to match(valid_icon)
    end
    it "return a kitten " do
      expect(subject.translateImg('adasdasd')).to match("http://")
    end
  end
end
