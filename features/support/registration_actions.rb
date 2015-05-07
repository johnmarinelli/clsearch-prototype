require 'capybara'

module Registration
  include Common

  class RegistrationActions < Common::Actions
  end
end

World(Registration)
