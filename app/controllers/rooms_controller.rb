# frozen_string_literal: true

class RoomsController < ApplicationController
  def index
    @rooms = Room.paginate(page: params[:page], per_page: 10)
  end
end
