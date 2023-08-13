require "rails_helper"

class LessonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  RSpec.describe "Lessons", type: :request do 
    let(:user) {create(:user)}
    before(:each) do
      # @attr_user = {
      #   name: "pablo",
      #   email: "user@example.com",
      #   password: "password",
      #   password_confirmation: "password"
      # }
      @attr_valid = {
        name: "Nombre",
      }
      @attr_invalid = {
        name: "",
      }
    end
  
    describe "index" do
      it "should return a successful request" do
          get "/lessons/index"
          expect(response).to have_http_status(:ok)
      end
    end
  
    describe "new" do 
      it "should return a successful request" do
          get "/lessons/new"
          expect(response).to have_http_status(:ok)
      end
    end
  
    describe "create" do
      it "should redirect after create a publication" do
        expect do
          # user = User.create!(@attr_user)
          sign_in user
          post "/lessons", params: { lesson: @attr_valid }
        end.to change(Lesson, :count).by(1)        
          # expect(response).to have_http_status(302)  #####podria ser mejor, como ver que aumentade la cuenta de juegos
      end
      it "should redirect after create a publication" do
        expect do
          # user = User.create!(@attr_user)
          sign_in user
          post "/lessons", params: { lesson: @attr_invalid }
        end.to change(Lesson, :count).by(0)
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