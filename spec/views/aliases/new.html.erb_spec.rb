require 'rails_helper'

RSpec.describe "aliases/new", :type => :view do
  before(:each) do
    assign(:alias, Alias.new(
      :username => "MyString",
      :email => "MyString",
      :user => nil
    ))
  end

  it "renders new alias form" do
    render

    assert_select "form[action=?][method=?]", aliases_path, "post" do

      assert_select "input#alias_username[name=?]", "alias[username]"

      assert_select "input#alias_email[name=?]", "alias[email]"

      assert_select "input#alias_user_id[name=?]", "alias[user_id]"
    end
  end
end
