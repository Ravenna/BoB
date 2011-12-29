class QuestionsController < ApplicationController
  def index
  end 
  
  def create
    @question = Question.new(params[:question])

        if @question.valid?
          QuestionMailer.new_question(@question).deliver
          redirect_to(question_path, :notice => "Question was successfully sent.")
        else
          flash.now.alert = "Please fill all fields."
          render :new
        end
  end

end
