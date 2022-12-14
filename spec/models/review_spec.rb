# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review, type: :model do
  describe '#approved' do
    let(:created_review) do
      create :review
    end

    context 'after initialization' do
      it 'must be automatically set to false' do
        expect(created_review.approved).to eq(0)
      end
    end
  end
end
