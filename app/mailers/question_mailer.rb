class QuestionMailer < ActionMailer::Base
  
  default :from => "info@bestofbauer.com"
  default :to => "info@bestofbauer.com"

   def new_message(question)
     @question = question
     mail(:subject => "Question from Best of Bauer.com")
   end
  
end
