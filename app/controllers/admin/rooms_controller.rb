class Admin::RoomsController < ApplicationController
  before_action :set_admin
  before_action :set_room, only: %i[ edit update destroy ]
  before_action :authenticate_user!

  # GET /admin/rooms or /admin/rooms.json
  def index
    @rooms = Room.all
  end

  # GET /admin/rooms/new
  def new
    @room = Room.new
    #add img
  end

  # GET /admin/rooms/1/edit
  def edit
    #add img
  end

  # POST /admin/rooms or /admin/rooms.json
  def create
    @room = Room.new(room_params)
    authorize @room

      if @room.save
        binding.irb
        @room.images.attach(params[:room][:images])
        flash[:success] = "Room was successfully created."
        redirect_to admin_rooms_path
      else
        render "admin/rooms/new"
      end
  end

  # PATCH/PUT /admin/rooms/1 or /admin/rooms/1.json
  def update
    authorize @room
      if @room.update(room_params)
        @room.images.attach(params[:room][:images])
        flash[:success] = "Room was successfully updated."
        redirect_to admin_rooms_path
      else
        render "admin/rooms/edit"
      end
  end

  # DELETE /admin/rooms/1 or /admin/rooms/1.json
  def destroy
    authorize @room
    @room.destroy
    flash[:success] = "Room was successfully destroyed."
    redirect_to admin_rooms_path
  end

  def delete_image_attachment
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge_later
    redirect_to edit_admin_room_path(params[:room_id])
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_room
    @room = Room.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def room_params
    params.require(:room).permit(:name, :cost, :description)
  end

  def set_admin
    @admin = true
  end
end