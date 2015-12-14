class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.save
    respond_to { |format| format.html { redirect_to @question, notice: 'New question submitted!' } }
  end

  private
  def question_params
    params.require(:question).permit(:title, :description, :user_id)
  end

end
