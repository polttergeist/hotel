# frozen_string_literal: true

module Admin
  class RoomsController < ApplicationController
    before_action :set_admin
    before_action :set_room, only: %i[edit update destroy]
    before_action :authenticate_user!

    def index
      @rooms = Room.all
    end

    def new
      @room = Room.new
    end

    def edit; end

    def create
      @room = Room.new(room_params)
      authorize @room

      if @room.save
        @room.images.attach(params[:room][:images])
        flash[:success] = 'Room was successfully created.'
        redirect_to admin_rooms_path
      else
        render 'admin/rooms/new'
      end
    end

    def update
      authorize @room
      if @room.update(room_params)
        @room.images.attach(params[:room][:images])
        flash[:success] = 'Room was successfully updated.'
        redirect_to admin_rooms_path
      else
        render 'admin/rooms/edit'
      end
    end

    def destroy
      authorize @room
      @room.destroy
      flash[:success] = 'Room was successfully destroyed.'
      redirect_to admin_rooms_path
    end

    def delete_image_attachment
      @image = ActiveStorage::Attachment.find(params[:id])
      @image.purge_later
      redirect_to edit_admin_room_path(params[:room_id])
    end

    private

    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:name, :cost, :description)
    end

    def set_admin
      @admin = true
    end
  end
end
