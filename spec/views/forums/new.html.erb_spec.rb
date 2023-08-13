require 'rails_helper'

RSpec.describe "forums/new", type: :view do
  before(:each) do
    assign(:forum, Forum.new(
      content: "MyText",
      user_name: "MyString",
      user_id: "",
      lesson_id: ""
    ))
  end

  it "renders new forum form" do
    render

    assert_select "form[action=?][method=?]", forums_path, "post" do

      assert_select "textarea[name=?]", "forum[content]"

      assert_select "input[name=?]", "forum[user_name]"

      assert_select "input[name=?]", "forum[user_id]"

      assert_select "input[name=?]", "forum[lesson_id]"
    end
  end
end
