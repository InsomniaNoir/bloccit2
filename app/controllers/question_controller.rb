class QuestionController < ApplicationController
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
    @question = Question.new(params.require(:post).permit(:title, :body, :resolved))
      if @question.save
        flash[:notice] = "Your question has been asked."
      else
        flash[:error] = "ID-10_T error. Please try again"
      render :new
      end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
      if @question.update_attributes(params.require(:post).permit(:title, :body, :resolved))
        flash[:notice] = "Your question has been updated."
      else
        flash[:error] = "ID-10-T error. Please try again"
      end
   end
end
