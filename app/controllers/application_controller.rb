class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def themes
    @themes ||= %w[cyborg readable cosmo flatly simplex]
  end
  helper_method :themes

  def current_theme
    begin
      theme = begin
        if current_user
          session[:theme] = current_user.theme
        else
          session[:theme] ||= 'flatly'
        end
      end
    rescue Exception => e
      puts e.message
      binding.pry
    end
    theme
  end
  helper_method :current_theme

  def current_user
    nil
  end
  helper_method :current_user

end
