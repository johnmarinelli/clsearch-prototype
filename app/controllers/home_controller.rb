class HomeController < ApplicationController

  def index
    ThanksForRegisteringMailer.thanks_for_registering.deliver
  end
end
