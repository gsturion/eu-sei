class ClassroomsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @classrooms = policy_scope(Classroom)
  end

  def new
    @classroom = Classroom.new
    authorize @classroom
  end
  
  def create
    @classroom = Classroom.new(classroom_params)
    authorize @classroom

    if @classroom.save
      redirect_to classroom_path(@classroom), notice: 'Questão criada com sucesso!'
    else
      render :new
    end
  end

  def feed
    @classroom = Classroom.find(params[:id])
    authorize @classroom
    @answer = Answer.new
  end

  def classroom_params
    params.require(:classroom).permit(:name, :year)
  end
end
