class QuestionMailer < ActionMailer::Base
  
  default :from => "bestofbauer@eddiebauer.com"
  default :to => "bestofbauer@eddiebauer.com"

   def new_question(question)
     @question = question
     mail(:subject => "Question from Best of Bauer.com") do |format|
      format.html{ render 'question_mailer/questions'}
    end 
   end
  
end
