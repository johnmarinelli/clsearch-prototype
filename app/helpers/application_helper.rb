module ApplicationHelper
  def get_navbar_path
    if user_signed_in?
      link_to 'Home', root_path
    else
      link_to 'Login', login_path
    end
  end

  def insert_top_margin
    if not current_page?(root_path) or user_signed_in?
      render 'templates/top_margin'
    end
  end
end
