class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    authorize @answer

    classroom = Alternative.find(@answer.alternative_id).question.classroom

    if @answer.save
      redirect_to feed_path(classroom), notice: "Resposta enviada"
    else
      redirect_to feed_path(classroom), notice: "Erro"
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:alternative_id)
  end
end