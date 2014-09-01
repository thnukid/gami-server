require 'rails_helper'
RSpec.describe Api::EventsController, :type => :controller do

  context "with valid params" do

      it "creates a new Event" do
        expect{
          post :create, :event => attributes_for(:event)
        }.to change(Event, :count).by(1)
      end

  end

  context "with invalid params" do
    it "doesnt create an Event"
  end

end
