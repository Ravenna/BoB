class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])

        if @question.valid?
          QuestionMailer.new_message(@question).deliver
          redirect_to(root_path, :notice => "Question was successfully sent.")
        else
          flash.now.alert = "Please fill all fields."
          render :new
        end
  end

end
