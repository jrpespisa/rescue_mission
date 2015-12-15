class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = Answer.where(question_id: @question.id)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      respond_to { |format| format.html { redirect_to @question, notice: 'New question submitted!' } }
    else
      flash[:notice] = "Please fill all forms correctly (title length >= 40, description length >= 150)"
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :description, :user_id)
  end
end
