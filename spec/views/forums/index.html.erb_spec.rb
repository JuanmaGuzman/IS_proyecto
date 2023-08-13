require 'rails_helper'

RSpec.describe "forums/index", type: :view do
  before(:each) do
    assign(:forums, [
      Forum.create!(
        content: "MyText",
        user_name: "User Name",
        user_id: "",
        lesson_id: ""
      ),
      Forum.create!(
        content: "MyText",
        user_name: "User Name",
        user_id: "",
        lesson_id: ""
      )
    ])
  end

  it "renders a list of forums" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "User Name".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
