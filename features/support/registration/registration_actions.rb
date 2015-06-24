require 'capybara'

module Registration
  include Common

  class RegistrationActions < Common::Actions
    def register(email)
      Common::session.first(:css, '#user_email').set email
    end

    def fill_in_top_registration_form(credentials)
      rows = credentials.rows_hash
      email = rows['Email']

      register email
    end

    def fill_in_bottom_registration_form(credentials)
      rows = credentials.rows_hash
      title = rows['Title']
      keywords = rows['Keywords']
      category = rows['Category']
      location = rows['Location']
      radius = rows['Radius']
      price_min = rows['Price min']
      price_max = rows['Price max']
      frequency = rows['Frequency']
      email = rows['Email'].gsub('@', Time.now.to_i.to_s + '@')

      Common::session.first(:css, '#user_queries_attributes_0_title').set title
      Common::session.first(:css, '#user_queries_attributes_0_heading').set keywords
      Common::session.first(:css, '#user_queries_attributes_0_category_group').set category
      Common::session.first(:css, '#location').set location
      Common::session.first(:css, '#user_queries_attributes_0_radius').set radius
      Common::session.first(:css, '#user_queries_attributes_0_price_min').set price_min
      Common::session.choose frequency
      Common::session.all(:css, '#user_email')[1].set email
    end

    def confirm_last_registration
      User.last.confirm!
      User.last.confirmed_at = Time.now
      User.last.save!
    end
  end

  @@registration_actions = RegistrationActions.new

  def self.actions
    @@registration_actions
  end
end

World(Registration)
