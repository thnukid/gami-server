require 'rails_helper'
require 'pry'

RSpec.describe "Events", :type => :request do
  describe "GET api/events" do
    it "return 200" do
      post api_events_path, :event => attributes_for(:event)
      binding.pry
      expect(response.status).to be(200)
    end
  end
end
