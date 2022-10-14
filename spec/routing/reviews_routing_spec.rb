# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReviewsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/reviews').to route_to('reviews#index')
    end

    it 'routes to #create' do
      expect(post: '/reviews').to route_to('reviews#create')
    end
  end
end
