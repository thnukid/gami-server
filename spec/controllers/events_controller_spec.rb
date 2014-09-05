require 'rails_helper'
RSpec.describe Api::EventsController, :type => :controller do



    let(:email) { 'glockenbeat@kabisa.nl' }
    let(:user) { attributes_for(:user) }
    #let!(:event) { create :event, user: user, email: email }
    let(:invalidData){{email: 'email@email.com', action: '', data: 'git'}}
    #binding.pry

 describe "Post create" do
   #context "with valid attributes" do
    #expect {
      #post :create, event: :event
    #}.to change(Event.count).by(1)
   #end
    context "with invalid attributes" do
      it{expect {
        post :create, event: :invalidData
      }.to respond_with 422}
    end
   end
 end

