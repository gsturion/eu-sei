class QuestionsController < ApplicationController
  before_action :set_question, only: [ :show, :edit, :destroy, :send ]
  before_action :set_classroom, only: [ :create ]

  def new
    @question = Question.new
    authorize @question
  end
  
  def create
    @question = Question.new(question_params)
    @question.classroom = @classroom
    authorize @question

    if @question.save
      redirect_to question_path(@question), notice: 'Questão criada com sucesso!'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
  end

  def send_question
  end

  private
  
  def set_question
    @question = Question.find(params[:id])
  end

  def set_classroom
    @classroom = Classroom.find(params[:classroom_id])
  end
  
  def question_params
    params.require(:question).permit(:content, :lesson, :releasedt_at)
  end
end
