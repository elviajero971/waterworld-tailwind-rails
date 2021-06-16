class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_locale

  protected

  def configure_permitted_parameters
    added_attrs = [:email, :firstname, :lastname, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  end

  private

  def set_locale
    if user_signed_in?
      I18n.locale = current_user.language
    else
      if params[:locale].nil?
        unless locale_from_header == 'fr'
          I18n.locale = 'en'
        end
      else
        I18n.locale = params[:locale]
      end
    end
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def locale_from_header
    request.env.fetch('HTTP_ACCEPT_LANGUAGE', '').scan(/[a-z]{2}/).first
  end


end
