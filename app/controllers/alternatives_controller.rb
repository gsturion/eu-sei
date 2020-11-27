class AlternativesController < ApplicationController
  before_action :set_question, only: [:new, :create, :update, :destroy]

  def new
    @alternative = Alternative.new
    authorize @alternative
  end

  def show
    authorize @alternative
  end

  def edit
  end

  def create
    @alternative = Alternative.new(alternative_params)
    @alternative.question = @question
    @question.classroom
    authorize @alternative

    if @alternative.save
      redirect_to new_question_alternative_path(@question), notice: 'Alternativa criada com sucesso.'
    else
      render :new
    end
  end

  def update
    #authorize @alternative
    if @alternative.update(alternative_params)
      redirect_to @alternative, notice: 'Alternativa atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @alternative = Alternative.find(params[:id])
    @alternative = @alternative.question
    @alternative.destroy

    redirect_to question_path(@question), notice: 'Alternativa excluída com sucesso.'
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def alternative_params
    params.require(:alternative).permit(:content, :is_correct, :question_id)
  end

end
