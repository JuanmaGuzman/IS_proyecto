require 'rails_helper'

RSpec.describe "forums/edit", type: :view do
  before(:each) do
    @forum = assign(:forum, Forum.create!(
      content: "MyText",
      user_name: "MyString",
      user_id: "",
      lesson_id: ""
    ))
  end

  it "renders the edit forum form" do
    render

    assert_select "form[action=?][method=?]", forum_path(@forum), "post" do

      assert_select "textarea[name=?]", "forum[content]"

      assert_select "input[name=?]", "forum[user_name]"

      assert_select "input[name=?]", "forum[user_id]"

      assert_select "input[name=?]", "forum[lesson_id]"
    end
  end
end
