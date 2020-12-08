class ClassroomsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_classroom, only: [ :feed, :dashboard, :show, :score ]

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
      @chatroom = Chatroom.new(name: "#{@classt}")
      redirect_to classroom_path(@classroom), notice: 'Questão criada com sucesso!'
    else
      render :new
    end
  end

  def show
    authorize @classroom
    @questions = Question.where(classroom_id: @classroom.id)
  end

  def feed
    authorize @classroom
    @alternative = Alternative.new
    @answer = Answer.new
    @display = @classroom.questions.select{ |q| q.can_be_displayed? && !q.answered?(current_user) }
  end

  def dashboard
    authorize @classroom
    @students = User.where(classroom_id: @classroom.id, is_teacher: false)
    @answers = Answer.where(user_id: current_user.id)
  end

  private

  def set_classroom
    @classroom = Classroom.find(params[:id])
  end

  def classroom_params
    params.require(:classroom).permit(:name, :year)
  end
end
