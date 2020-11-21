class ClassroomsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_classroom, only: [ :feed, :dashboard, :show ]

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

  def show
    authorize @classroom
  end

  def feed
    authorize @classroom
    @alternative = Alternative.new
    @answer = Answer.new
  end

  def dashboard
    authorize @classroom
    
  end

  private

  def set_classroom
    @classroom = Classroom.find(params[:id])
  end

  def classroom_params
    params.require(:classroom).permit(:name, :year)
  end
end
