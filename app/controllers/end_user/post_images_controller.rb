class EndUser::PostImagesController < EndUser::BaseController
def create
    @post_image = PostImage.new(post_image_params)
    @room = Room.find(params[:room_id])
    @post_image.user_id = current_user.id
    @post_image.room_id = @room.id
    @post_image.save
    redirect_to room_path(@room)
end


private
def post_image_params
    params.require(:post_image).permit(:user_id, :room_id, :post_image)
end

end
