class LessonsController < ApplicationController
  def new
    @lesson = Lesson.new
    @course = Course.find(params[:id])
  end

  def create
    puts "\n \n !!!!!!ENTRE A CONTROLADOR CREATE!!!!!!!!!!!\n \n"
    @lessons_params = params.require(:lesson).permit(:name, :course_id, :video)
    @lesson = Lesson.create(@lessons_params)
    @lesson.video.attach(params[:video])
    if @lesson.save
      redirect_to course_path(:id => @lessons_params[:course_id]), notice: 'Lesson successfully created'
    else
      redirect_to course_path(:id => @lessons_params[:course_id]), notice: 'Error while creating the lesson'
    end
  end

  def index
    @lesson = Lesson.all
    
  end

  def show
    @lesson = Lesson.find(params[:id])
    @forum = Forum.all
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    puts "\n \n !!!!!!ENTREENTRE A CONTROLADOR UPDATE!!!!!!\n \n"
    @lesson = Lesson.find(params[:id])
    @lessons_new_params = params.require(:lesson).permit(:name, :course_id, :video)
    @lesson.video.attach(params[:video])
    if @lesson.update(@lessons_new_params)
      redirect_to course_path(:id => @lessons_new_params[:course_id]), notice: 'Lesson correctly edited'
    else
      redirect_to course_path(:id => @lessons_new_params[:course_id]), notice: 'Error while editing the lesson'
    end
  end

  def delete
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    redirect_to course_path(:id => @lesson.course_id), notice: 'Lesson succesfully deleted!'
  end
end
# comentario