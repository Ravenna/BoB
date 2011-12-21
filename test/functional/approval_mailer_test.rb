require 'test_helper'

class ApprovalMailerTest < ActionMailer::TestCase
  test "needs_approval" do
    mail = ApprovalMailer.needs_approval
    assert_equal "Needs approval", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
