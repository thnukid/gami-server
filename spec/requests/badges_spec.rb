require 'rails_helper'

RSpec.describe "Badges", :type => :request do
  describe "GET /badges" do
    it "works! (now write some real specs)" do
      get badges_path
      expect(response.status).to be(200)
    end
  end
end
