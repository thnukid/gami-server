require 'rails_helper'

RSpec.describe "badges/edit", :type => :view do
  before(:each) do
    @badge = assign(:badge, Badge.create!(
      :name => "MyString",
      :description => "MyString",
      :picture => "MyString",
      :user => nil
    ))
  end

  it "renders the edit badge form" do
    render

    assert_select "form[action=?][method=?]", badge_path(@badge), "post" do

      assert_select "input#badge_name[name=?]", "badge[name]"

      assert_select "input#badge_description[name=?]", "badge[description]"

      assert_select "input#badge_picture[name=?]", "badge[picture]"

      assert_select "input#badge_user_id[name=?]", "badge[user_id]"
    end
  end
end
