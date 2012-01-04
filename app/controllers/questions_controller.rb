class QuestionsController < ApplicationController
  before_filter :inbox_value, :if_recommendations
  
  
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
