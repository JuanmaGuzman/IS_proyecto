class InscriptionsController < ApplicationController
  def new
    @inscription = Inscription.new
    @user = User.all
    @course = Course.find(params[:id])
  end

  def show
  end

  def create
    @inscriptions_params = params.require(:inscription).permit(:course_id, :user_id, :isprofesor)
    @inscription = Inscription.create(@inscriptions_params)
    #@user = User.find_by(id: params[:user_id])
    #@inscription = @user.inscriptions.build(@inscriptions_params)
    if @inscription.save
      redirect_to courses_path, notice: 'inscription successfully created'
    else
      redirect_to courses_path, notice: 'Error while creating the inscription'
    end
  end

  def index
    @inscription = Inscription.all
    @user = User.all
    @course = Course.all
  end

  def edit
  end

  def update
  end

  def destroy
    @inscription = Inscription.find(params[:id])
    @inscription.destroy
    redirect_to courses_path, notice: 'Succesfully unsuscribe'
  end

end
