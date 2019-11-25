class EndUser::RoomsController < EndUser::BaseController
  def top
  end

  def index
    @rooms = Room.all
    # @room = Room.find(params[:id])
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages # Room(親)モデルのhas_manyとおなじ
  end

  def new
      @room = Room.new
  end

  def edit
  end

  def create
    @room = Room.new(room_params)
    binding.pry
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
