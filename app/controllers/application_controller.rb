class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        case resource
        when AdminUser
            admin_root_path
        when User
            rooms_path
        end
    end
    # def after_sign_out_path_for(resource)
    #     # case resource
    #     # when AdminUser
    #     #     admin_root_path
    #     # when User
    #         root_path
        # end

    # def after_sign_up_path_for(resource)
    #         case resource
    #         when AdminUser
    #             session[:previous_url] || admin_root_path
    #         when EndUser
    #             root_path
    #         end
    # end







end
