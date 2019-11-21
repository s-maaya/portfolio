class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        case resource
        when AdminUser
            admin_root_path
        when User
            rooms_path
        end
    end


    before_action :configure_permitted_parameters, if: :devise_controller?
    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        #ユーザー登録（sign_up)の際にユーザー名（neme)のデータ操作が許可される。
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
