# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe '#approved' do
    let(:created_booking) do
      create :booking
    end

    context 'after initialization' do
      it 'must be automatically set to false' do
        create :room, id: 1
        expect(created_booking.approved).to eq(0)
      end
    end
  end
end
