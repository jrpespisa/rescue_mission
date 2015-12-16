class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      respond_to { |format| format.html { redirect_to :back, notice: 'New answer submitted!' } }
    else
      flash[:notice] = "Please fill all forms correctly (description length >= 50)"
      redirect_to :back
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:description, :user_id, :question_id)
  end

end
