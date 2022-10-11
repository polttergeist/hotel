# frozen_string_literal: true

class RoomPolicy < ApplicationPolicy
  attr_reader :current_user, :room

  def initialize(current_user, room)
    super
    @current_user = current_user
    @room = room
  end

  def update?
    current_user.admin?
  end

  def create?
    current_user.admin?
  end

  def destroy?
    current_user.admin?
  end
end
