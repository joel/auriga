class ApplicationController < ActionController::Base
  include UrlHelper

  class Forbidden < StandardError; end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery # with: :exception # http://goo.gl/6esHjG # raise ActionController::InvalidAuthenticityToken

  before_filter :authenticate_user!
  # before_filter :configure_permitted_parameters, if: :devise_controller?

  around_filter :scope_current_vault, unless: :devise_controller?

  protected

  def current_vault
    return nil unless user_signed_in?

    vault = current_user.vault.tap do
      if current_user.vault.subdomain != request.subdomain
        binding.pry
        raise Forbidden, I18n.t('exception.forbidden')
      end
    end
    vault
  end
  helper_method :current_vault

  def scope_current_vault
    Mongoid::Multitenancy.current_tenant = current_vault
    yield
  rescue => e
    Rails.logger.error e.message
    Mongoid::Multitenancy.current_tenant = nil
    raise
  end

  def themes
    @themes ||= %w[cyborg readable cosmo flatly simplex cerulean]
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
      # binding.pry
    end
    theme
  end
  helper_method :current_theme

  private

  # def after_sign_up_path_for resource
  #   new_vault_path
  # end

  def after_sign_in_path_for resource
    # binding.pry
    unless resource.vault
      new_vault_path
    else
      # binding.pry
      users_url(subdomain: resource.vault.subdomain)
    end
  end

  def after_sign_out_path_for resource
    sign_out current_user
    root_url(subdomain: 'www', protocol: :http)
  end

end
