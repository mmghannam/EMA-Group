class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    before_action :configure_devise_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(user)
        if is_admin?
            :admin_dashboard
        else
            :client_dashboard
        end
    end

    def is_client?
        current_user and current_user.client?
    end

    def is_admin?
        current_user and current_user.admin?
    end

    def admin_authenticated?
        unless is_admin?
            redirect_to :root
        end
    end

    protected

    def configure_devise_permitted_parameters
        registration_params = [:name, :position, :email, :password, :password_confirmation, :landline_number, :address, :mobile_number, :workplace]

        if params[:action] == 'update'
            devise_parameter_sanitizer.for(:account_update) {
                |u| u.permit(registration_params << :current_password)
            }
        elsif params[:action] == 'create'
            devise_parameter_sanitizer.for(:sign_up) {
                |u| u.permit(registration_params)
            }
        end
    end
end
