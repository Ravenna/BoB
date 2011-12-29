class QuestionMailer < ActionMailer::Base
  
  default :from => "info@bestofbauer.com"
  default :to => "tj@ravennainteractive.com"

   def new_question(question)
     @question = question
     mail(:subject => "Question from Best of Bauer.com") do |format|
      format.html{ render 'question_mailer/questions'}
    end 
   end
  
end
