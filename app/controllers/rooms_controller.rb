class RoomsController < ApplicationController
  def index
    #if a type of room is chosen, only display rooms with that type
    if params[:type].blank?
      @rooms = Room.all.order("created_at DESC")
    else
      @rooms = Room.where(:type_id => @type_id)
    end
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
    #only redirect if a new room is created
    if @room.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @room = Room.find(params[:id])
    @types = Type.all.map { |a| [a.name, a.id] }
  end

  def update
    @room = Room.find(params[:id])
    @room.type_id = params[:type_id]
    #only redirect if room is updated
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
