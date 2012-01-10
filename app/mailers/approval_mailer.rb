class ApprovalMailer < ActionMailer::Base
  default from: "bestofbauer@bestofbauer.com"
  default cc: "admin@bestofbauer.com"

  
  def needs_approval(approval)
    @approval = approval
    @greeting = "Hi"

    mail to: @approval.email, subject: "Best of Bauer recommendation needs your approval"
  end
end
