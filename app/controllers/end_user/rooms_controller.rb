class EndUser::RoomsController < EndUser::BaseController
  before_action :authenticate_user!, only:[:show]

  def top
  end

  def index
    @rooms = Room.all.reverse_order
    # @room = Room.find(params[:id])
  end

  def show
    @post_image = PostImage.new
    @room = Room.find(params[:id])
    @messages = @room.messages # Room(親)モデルのhas_manyとおなじ
    @post_images = @room.post_images
  end

  def new
      @room = Room.new
  end

  def edit
  end

  def create
    @room = Room.new(room_params)
    # 現在ログインしているユーザーの情報をroom.userに代入する
    @room.user_id = current_user.id
    if @room.save
      redirect_to room_path(@room.id)
    else
      render :new_room
    end
  end


  private
  def room_params
    params.require(:room).permit(:user_id, :image, :title, :details, :address, :station, :start_date)
  end
end
