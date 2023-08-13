require "rails_helper"

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  RSpec.describe "Articles", type: :request do 
    describe "index" do
      it "should return a successful request" do
          get "/articles/index"
          expect(response).to have_http_status(:ok)
      end
    end
  end
end
  
# it "should redirect after create a publication" do
#   expect do
#     user = User.create!(@attr_user)
#     sign_in user
#     post "/lessons", params: { lesson: @attr_invalid }
#   end.to change(Lesson, :count).by(0)
# end 