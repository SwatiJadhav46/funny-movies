class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # before_action :authenticate_user!

  def render_result(service_class, params, path)
    service = service_class.new(params, current_user)
    service.call

    if service.result.persisted?
      redirect_to path
    else
      render json: service.errors.full_messages, status: 422
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  def after_sign_in_path_for(resource_or_scope)
    shared_videos_path
  end
end
