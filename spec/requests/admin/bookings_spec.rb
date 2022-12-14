# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/admin/bookings', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Admin::Booking. As you add validations to Admin::Booking, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      name: Faker::Name.name,
      email: Faker::Internet.email,
      start_date: DateTime.new(2023, 0o1, 0o1),
      end_date: DateTime.new(2023, 0o1, 0o3),
      room_id: 1
    }
  end

  let(:admin) do
    User.create! email: 'sample@email.com', password: 'samplepassword000', role: :admin
  end

  before do
    sign_in admin
    Room.create! id: 1, name: 'test_room', description: 'test_desc', cost: 228
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Booking.create! valid_attributes
      sign_in(:admin)
      get admin_bookings_url
      expect(response).to be_successful
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested booking' do
      booking = Booking.create! valid_attributes
      expect do
        delete admin_booking_url(booking)
      end.to change(Booking, :count).by(-1)
    end

    it 'redirects to the bookings list' do
      booking = Booking.create! valid_attributes
      delete admin_booking_url(booking)
      expect(response).to redirect_to(admin_bookings_url)
    end
  end
end
