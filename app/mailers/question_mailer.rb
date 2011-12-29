class QuestionMailer < ActionMailer::Base
  
  attr_accessor :name, :email, :question
  
  default from: "info@bestofbauer.com"
  
  
  
  def question_email(message)
      @message = message
      
      mail( 
        :to => email,
        :subject => "Question from Best of Bauer", 
        :name => name,
        :email => email
        :question => question
         ) 
      
    end
end
