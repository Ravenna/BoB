class ApprovalMailer < ActionMailer::Base
  default from: "bestofbauer@eddiebauer.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.approval_mailer.needs_approval.subject
  #
  def needs_approval(approval)
    @approval = approval
    @greeting = "Hi"

    mail to: @approval.email, subject: "Best of Bauer recommendation needs your approval"
  end
end
