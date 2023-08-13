# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    #@course = Course.new
    @course = current_user.courses.build
  end

  def create
    @courses_params = params.require(:course).permit(:name, :price, :user_id)
    #@course = Course.create(@courses_params)
    @course = current_user.courses.build(@courses_params)
    if @course.save
      redirect_to courses_path, notice: 'Course successfully created'
    else
      redirect_to courses_path, notice: 'Error while creating the course'
    end
  end

  def index
    @course = Course.all
    @user = User.all
    @inscription = Inscription.all
  end

  def show
    @course = Course.find(params[:id])
    @user = User.all
    @lesson = Lesson.all
    @inscription = Inscription.all
    @review = Review.all
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    @courses_new_params = params.require(:course).permit(:name, :price, :user_id)
    if @course.update(@courses_new_params)
      redirect_to courses_path, notice: 'course edited correctly'
    else
      redirect_to courses_path, notice: 'Error while editing the course'
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to courses_path, notice: 'course nicely destroyed'
  end

  def correct_user
    # @course = current_user.courses.find_by(id: params[:id])
    @course = Course.find(params[:id])
    redirect_to courses_path, notice: "Not authorize to edit this course" if @course.nil?
  end
end