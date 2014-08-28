require 'rails_helper'

RSpec.describe "Aliases", :type => :request do
  describe "GET /aliases" do
    it "works! (now write some real specs)" do
      get aliases_path
      expect(response.status).to be(200)
    end
  end
end
