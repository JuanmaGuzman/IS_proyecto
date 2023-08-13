require 'rails_helper'

RSpec.describe "forums/show", type: :view do
  before(:each) do
    @forum = assign(:forum, Forum.create!(
      content: "MyText",
      user_name: "User Name",
      user_id: "",
      lesson_id: ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/User Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
