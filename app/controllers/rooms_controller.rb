class RoomsController < ApplicationController
  def index
    @rooms = Room.all.order("created_at DESC")
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = current_user.rooms.build
    @types = Type.all.map { |a| [a.name, a.id] }
  end

  def create
    @room = current_user.rooms.build(room_params)
    @room.type_id = params[:type_id]
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
    @room.type_id = params[:type_id]
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
      params.require(:room).permit(:address, :description, :price, :contact_info, :type_id)
    end

end
