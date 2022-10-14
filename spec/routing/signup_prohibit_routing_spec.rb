# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SignupProhibitController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: 'users/sign_up').to route_to('signup_prohibit#index')
    end

    it 'routes to #create' do
      expect(post: 'users/sign_up').to route_to('signup_prohibit#create')
    end
  end
end
