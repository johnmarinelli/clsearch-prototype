module ApplicationHelper
  def get_navbar_path
    if user_signed_in?
      link_to 'Home', root_path
    else
      link_to 'Login', login_path
    end
  end

  def get_edit_profile_link
    if user_signed_in?
      link_to 'Edit Profile Information', edit_user_registration_path
    end
  end

  def insert_top_margin
    if not current_page?(root_path) or user_signed_in?
      render 'templates/nav/top_margin'
    end
  end

  def get_signout_link
    if user_signed_in?
      link_to 'Sign Out', logout_path, :method => :delete 
    end
  end
end
