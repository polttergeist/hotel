class RoomPolicy < ApplicationPolicy
  def update?
    user.administrator?
  end
end
