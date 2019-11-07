class EndUser::BaseController < ApplicationController
    layout 'end_user'

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        #ユーザー登録（sign_up)の際にユーザー名（neme)のデータ操作が許可される。
    end

end
