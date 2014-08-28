require 'rails_helper'

RSpec.describe "aliases/edit", :type => :view do
  before(:each) do
    @alias = assign(:alias, Alias.create!(
      :username => "MyString",
      :email => "MyString",
      :user => nil
    ))
  end

  it "renders the edit alias form" do
    render

    assert_select "form[action=?][method=?]", alias_path(@alias), "post" do

      assert_select "input#alias_username[name=?]", "alias[username]"

      assert_select "input#alias_email[name=?]", "alias[email]"

      assert_select "input#alias_user_id[name=?]", "alias[user_id]"
    end
  end
end
