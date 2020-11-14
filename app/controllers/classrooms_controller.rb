class ClassroomsController < ApplicationController
  def index
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

  def classroom_params
    params.require(:classroom).permit(:name, :year)
  end
end
