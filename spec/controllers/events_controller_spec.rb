require 'rails_helper'
RSpec.describe Api::EventsController, :type => :controller do



    let(:email) { 'glockenbeat@kabisa.nl' }
    let(:invalidData){{email: email, action: '', data: 'git'}}
    let(:validData){{email: email, action: 'git:push', data: 'data' }}
    #binding.pry

 describe "Post create" do

   context "with valid attributes" do
      before do
         create :alias
      end

      it "should return 200 response" do
        post :create,event: validData
        expect(response.status).to eq(200)
      end
   end

   context "with invalid attributes" do
      it "should return 422 error response" do
         post :create, event: invalidData
         expect(response.status).to eq(422)
      end

    end
   end
 end

