class ForumsController < ApplicationController
  before_action :set_forum, only: %i[ show edit update destroy ]

  # GET /forums or /forums.json
  def index
    @forums = Forum.all
  end

  # GET /forums/1 or /forums/1.json
  def show
  end

  # GET /forums/new
  def new
    @forum = Forum.new
    @lesson = Lesson.find(params[:id])
  end

  # GET /forums/1/edit
  def edit
  end

  # POST /forums or /forums.json
  def create
    @forums_params = params.require(:forum).permit(:user_name, :content, :date, :user_id, :lesson_id)
    @forum = Forum.create(@forums_params)
    if @forum.save
      redirect_to lessons_show_path(:id => @forums_params[:lesson_id]), notice: 'Comment successfully created'
    else
      redirect_to lessons_show_path(:id => @forums_params[:lesson_id]), notice: 'Error while creating the comment'
    end
  end

  # PATCH/PUT /forums/1 or /forums/1.json
  def update
    respond_to do |format|
      if @forum.update(forum_params)
        format.html { redirect_to @forum, notice: "Forum was successfully updated." }
        format.json { render :show, status: :ok, location: @forum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forums/1 or /forums/1.json
  def destroy
    @forum.destroy
    respond_to do |format|
      format.html { redirect_to forums_url, notice: "Forum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_forum
    @forum = Forum.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def forum_params
    params.require(:forum).permit(:date, :content, :user_name, :user_id, :lesson_id)
  end
end
