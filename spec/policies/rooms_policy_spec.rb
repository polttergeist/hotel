# frozen_string_literal: true

require 'rails_helper'
require 'pundit/rspec'

RSpec.describe RoomPolicy, type: :policy do
  let(:moder) do
    User.create! email: 'sample@email.com', password: 'samplepassword000', role: :moder
  end

  let(:admin) do
    User.create! email: 'samplesample@email.com', password: 'samplepassword000', role: :admin
  end

  let(:new_room) { create :room }

  subject { RoomPolicy }

  permissions :create?, :update?, :destroy? do
    it 'denies access if a user is a moderator' do
      expect(subject).not_to permit(moder, new_room)
    end

    it 'grants access if a user is an administrator' do
      expect(subject).to permit(admin, new_room)
    end
  end
end
