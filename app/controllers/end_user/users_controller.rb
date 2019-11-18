class EndUser::UsersController < EndUser::BaseController
    def show
      @user = User.find(params[:id])
        @rooms = @user.rooms
        @messages = @user.messages
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user.id)
    end


    private
    def user_params
        params.require(:user).permit(:image, :name)
    end
end



