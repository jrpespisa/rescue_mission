class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    @answer.save
    respond_to { |format| format.html { redirect_to :back, notice: 'New answer submitted!' } }
  end

  private
  def answer_params
    params.require(:answer).permit(:description, :user_id, :question_id)
  end

end
