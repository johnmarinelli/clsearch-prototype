class HomeController < ApplicationController
  def index
    a = ThanksForRegisteringMailer.thanks_for_registering.deliver
  end
end
