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
      flash.now[:notice] = "Please fill all forms correctly (title length >= 40, description length >= 150)"
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      respond_to { |format| format.html { redirect_to @question, notice: "Question updated successfully!" } }
    else
      flash.now[:notice] = "Please fill out form properly!!!"
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @answers = Answer.where("question_id = ?", @question.id)
    @answers.destroy_all
    @question.destroy
    redirect_to :questions
    # respond_to { |format| format.html { redirect_to :questions, notice: "Question deleted successfully!" } }
  end

  private
  def question_params
    params.require(:question).permit(:title, :description, :user_id)
  end
end
