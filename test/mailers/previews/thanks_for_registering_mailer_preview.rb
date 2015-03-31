# Preview all emails at http://localhost:3000/rails/mailers/thanks_for_registering_mailer
class ThanksForRegisteringMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/thanks_for_registering_mailer/thanks_for_registering
  def thanks_for_registering
    ThanksForRegisteringMailer.thanks_for_registering
  end

end
