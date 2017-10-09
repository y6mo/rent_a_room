class RoomsController < ApplicationController
  def index
    @rooms = Room.all.order("created_at DESC")
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = current_user.rooms.build
    @room_types = RoomType.all.map{ |c| [c.name, c.id] }
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to room_path(@room)
    else
      render 'edit'
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to root_path
  end

  private
    def room_params
      params.require(:room).permit(:address, :description, :price, :contact_info)
    end

end
