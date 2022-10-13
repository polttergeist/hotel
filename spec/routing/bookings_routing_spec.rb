require "rails_helper"

RSpec.describe BookingsController, type: :routing do
  describe "routing" do
    it "routes to #new" do
      expect(get: "/booking/new?room_id=1").to route_to(controller: "bookings", action: "new", room_id: "1")
    end

    it "routes to #create" do
      expect(post: "/booking/new?room_id=1").to route_to(controller: "bookings", action: "create", room_id: "1")
    end
  end
end
