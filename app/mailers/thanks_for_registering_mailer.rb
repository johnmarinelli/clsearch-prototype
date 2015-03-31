class ThanksForRegisteringMailer < ApplicationMailer
  default from: "john.marinelli.dev@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.thanks_for_registering_mailer.thanks_for_registering.subject
  #
  def thanks_for_registering
    @greeting = "Hi"

    mail to: "jonmarinelli@hotmail.com", subject: "fuck yea"
  end
end
