class EndUser::RoomsController < EndUser::BaseController
  before_action :authenticate_user!, only:[:show]

  def top
  end

  def index
    @rooms = Room.all.reverse_order
    # @room = Room.find(params[:id])
  end

  def show
    @room = Room.find(params[:id])
    if @room.password_digest.present? && session[:authenticated_room] != @room.id
      redirect_to rooms_path
    else
    @post_image = PostImage.new
    @messages = @room.messages # Room(親)モデルのhas_manyとおなじ
    @post_images = @room.post_images
    session.delete(:authenticated_room)
    end
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
      session[:authenticated_room]=@room.id
      redirect_to room_path(@room.id)
    else
      render :new_room
    end
  end



#パスワードの入力画面
  def input_password
    @room = Room.find(params[:id])
  end

    # パスワードの認証アクション
  def authenticate
    room = Room.find(params[:id])
    if room.authenticate(params[:room][:password])
      #通行書の役割
      session[:authenticated_room]=room.id
      redirect_to room_path(room)
    else
      @room = room
      render :input_password
    end
  end


  private
  def room_params
    params.require(:room).permit(:user_id, :image, :title, :details, :address, :station, :start_date, :password)
  end
end
