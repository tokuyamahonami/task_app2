class ApplicationController < ActionController::Base
    #before_action :authenticate_user!

    before_action :configure_permitted_parameters, if: :devise_controller?

    before_action :set_q


    def after_sign_in_path_for(resource)
        users_show_path(current_user.id)
    end

    def after_sign_out_path_for(resource)
        new_user_session_path
    end


    def search
        @results = @q.result
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image ])
    end

    private

    def set_q
        @q = Room.ransack(params[:q])
    end


end
