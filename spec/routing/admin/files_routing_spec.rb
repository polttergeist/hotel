require "rails_helper"

RSpec.describe Admin::FilesController, type: :routing do
  describe "routing" do
    it "routes to #download" do
      expect(get: "/admin/bookings_controller.csv").to route_to("admin/files#download", format: "csv")
      expect(get: "/admin/bookings_controller.xlsx").to route_to("admin/files#download", format: "xlsx")
    end
  end
end
