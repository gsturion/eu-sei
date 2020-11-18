class QuestionsController < ApplicationController
  before_action :set_question, only: [ :show, :edit, :destroy, :send ]
  before_action :set_classroom, only: [ :create, :new ]

  def index
    @questions = policy_scope(Question)
  end

  def new
    @question = Question.new
    authorize @question
  end

  def create
    @question = Question.new(question_params)
    @question.classroom = @classroom
    @question.user_id = current_user.id
    authorize @question

    if @question.save
      redirect_to new_question_alternative_path(@question), notice: 'Questão criada com sucesso!'
    else
      render :new
    end
  end

  def show
    authorize @question

  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: 'Questão atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_url, notice: 'Questão excluída com sucesso.'
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
