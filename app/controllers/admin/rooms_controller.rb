class Admin::RoomsController < Admin::BaseController
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
    @room.save
    redirect_to room_path(@room)
  end


  private
  def room_params
    params.require(:room).permit(:image, :title, :details, :address, :station)
  end
end
