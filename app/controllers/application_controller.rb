class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:human_first_name,:human_last_name,:human_first_name_rubi,:human_last_name_rubi,:pets_name,:pets_name_rubi,:pets_type,:pets_age])
  end

end
