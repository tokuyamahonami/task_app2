class ApplicationController < ActionController::Base
    #before_action :authenticate_user!
    before_action :set_q, only: [:index, :search]

    before_action :configure_permitted_parameters, if: :devise_controller?
    

    def search
        @results = @q.result
    end

    protected

    def set_q
        @q = Room.ransack(params[:q])
    end
    

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

    def after_sign_in_path_for(resource)
        user_path(current_user.id)
    end

    def after_sign_out_path_for(resource)
        new_user_session_path
    end

end
