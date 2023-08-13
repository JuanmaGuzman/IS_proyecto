require "rails_helper"

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  RSpec.describe "Courses", type: :request do 
    let(:user) {create(:user)}
    # let(:user2) {create(:user)}
    before(:each) do
      
      # @attr_user = {
      #   name: "pablo",
      #   email: "user@example.com",
      #   password: "password",
      #   password_confirmation: "password"
      # }
      @attr_valid = {
        name: "Nombre",
        price: 1,
      }
      @attr_valid_2 = {
        name: "pepe",
        price: 2,
      }
      @attr_invalid = {
        name: "Nombre",
        price: "Nombre",
      }
    end
  
    describe "index" do 
      it "should return a successful request" do 
          get "/courses/index"
          expect(response).to have_http_status(:ok)
      end
    end
  
    describe "new" do 
      it "should return a successful request" do 
          get "/courses/new"
          expect(response).to have_http_status(:ok)
      end
    end
  
    describe "create" do
      it "should redirect after create a publication" do
        expect do
          # user = User.create!(@attr_user)
          sign_in user
          post "/courses", params: { course: @attr_valid }
        end.to change(Course, :count).by(1)        
          # expect(response).to have_http_status(302)  #####podria ser mejor, como ver que aumentade la cuenta de juegos
      end
  
      it "should redirect after create a publication" do
        expect do
          # user = User.create!(@attr_user)
          sign_in user
          post "/courses", params: { course: @attr_invalid }
        end.to change(Course, :count).by(0)
      end 
    end

    describe "update" do
      it "should not add 1 to count" do
        expect do
          sign_in user
          post "/courses", params: { course: @attr_valid}
          patch "/courses/update", params: { course: @attr_valid_2}
        end.to change(Course, :count).by(0)
      end
    end
    # describe "delete" do
    #   it "should delete the curse" do
    #     expect do
    #       sign_in user
    #       post "/courses", params: { course: @attr_valid}
    #       @course = Course.find(params[:course.id])
    #       delete "/courses/delete", params: { course: @course }
    #     end.to change(Course, :count).by(0)
    #   end
    # end
  end
end
  