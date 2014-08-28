require 'rails_helper'

RSpec.describe "badges/index", :type => :view do
  before(:each) do
    assign(:badges, [
      Badge.create!(
        :name => "Name",
        :description => "Description",
        :picture => "Picture",
        :user => nil
      ),
      Badge.create!(
        :name => "Name",
        :description => "Description",
        :picture => "Picture",
        :user => nil
      )
    ])
  end

  it "renders a list of badges" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Picture".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
