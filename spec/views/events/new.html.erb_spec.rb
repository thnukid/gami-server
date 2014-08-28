require 'rails_helper'

RSpec.describe "events/new", :type => :view do
  before(:each) do
    assign(:event, Event.new(
      :name => "MyString",
      :data => "MyString",
      :user => nil
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input#event_name[name=?]", "event[name]"

      assert_select "input#event_data[name=?]", "event[data]"

      assert_select "input#event_user_id[name=?]", "event[user_id]"
    end
  end
end
