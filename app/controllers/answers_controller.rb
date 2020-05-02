class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_answer, only: %i[show edit update destroy]
  before_action :find_question, only: %i[new create]

  def show; end

  def edit; end

  def new
    @answer = Answer.new
  end

  def create
    @answer = @question.answers.build(answer_params)

    if @answer.save
      redirect_to @answer.question
    else
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to @answer.question
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to @answer.question
  end

  private
  def answer_params
    params.require(:answer).permit(:body, :correct, :question_id)
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def find_question
    @question = Question.find(params[:question_id])
  end
end
