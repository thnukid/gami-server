require 'rails_helper'

RSpec.describe "aliases/show", :type => :view do
  before(:each) do
    @alias = assign(:alias, Alias.create!(
      :username => "Username",
      :email => "Email",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(//)
  end
end
