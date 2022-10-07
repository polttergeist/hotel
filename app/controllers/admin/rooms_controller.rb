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
  end

  # GET /admin/rooms/1/edit
  def edit
  end

  # POST /admin/rooms or /admin/rooms.json
  def create
    @room = Room.new(room_params)
    authorize @room

    respond_to do |format|
      if @room.save
        format.html { redirect_to admin_rooms_path, notice: "Room was successfully created." }
        format.json { render :index, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/rooms/1 or /admin/rooms/1.json
  def update
    authorize @room
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to admin_room_url(@room), notice: "Room was successfully updated." }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/rooms/1 or /admin/rooms/1.json
  def destroy
    authorize @room
    @room.destroy

    respond_to do |format|
      format.html { redirect_to admin_rooms_url, notice: "Room was successfully destroyed." }
      format.json { head :no_content }
    end
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
