require 'rails_helper'

RSpec.describe "aliases/index", :type => :view do
  before(:each) do
    assign(:aliases, [
      Alias.create!(
        :username => "Username",
        :email => "Email",
        :user => nil
      ),
      Alias.create!(
        :username => "Username",
        :email => "Email",
        :user => nil
      )
    ])
  end

  it "renders a list of aliases" do
    render
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
