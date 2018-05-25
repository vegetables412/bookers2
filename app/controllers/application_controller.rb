class ApplicationController < ActionController::Base
	 before_action :authenticate_user!, :except=>[:top]
  protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
        flash[:notice] = "Signed in successfully."
        user_path(current_user.id)
    end


    # def after_sign_out_path_for(resource)
    #     flash[:alert] = "Signed out successfully."
    #     top_path
    # end


	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
	end
	def sign_in_required
		redirect_to new_user_session_url unless user_signed_in?
	end
end
