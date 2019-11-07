class EndUser::RoomsController < EndUser::BaseController
  def top
  end

  def index
  end

  def show
  end

  def new
      @room = Room.new
  end

  def edit
  end

  def create
    @room = Room.new(room_params)
    @room.save
    redirect_to root_path
  end


  private
  def room_params
    params.require(:room).permit(:image_id, :title, :details, :address, :station)
  end
end
