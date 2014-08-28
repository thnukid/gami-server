require 'rails_helper'

RSpec.describe "badges/show", :type => :view do
  before(:each) do
    @badge = assign(:badge, Badge.create!(
      :name => "Name",
      :description => "Description",
      :picture => "Picture",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Picture/)
    expect(rendered).to match(//)
  end
end
