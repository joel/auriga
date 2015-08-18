module MailerHelper
  def last_email
    ActionMailer::Base.deliveries.last
  end

  def email_deliveries
    ActionMailer::Base.deliveries
  end
end
