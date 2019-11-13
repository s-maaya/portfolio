class ApplicationController < ActionController::Base
    # def after_sign_in_path_for(resource)
    #     case resource
    #     when EndUser
    #         session[:previous_url] || root_path
    #     when Admin
    #         admin_root_path
    #     end
    # end
    def after_sign_up_path_for(resource)
        case resource
        when EndUser
            session[:previous_url] || root_path
        when Admin
            session[:previous_url] || admin_root_path
        end
    end
    # def after_sign_out_path_for(resource)
    #     case resource
    #     when :end_user
    #         root_path
    #     when :admin
    #         admin_root_path
    #     end
    # end
end
