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

RSpec.describe '/rooms', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Room. As you add validations to Room, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      name: Faker::Name.name,
      description: Faker::Lorem.sentence,
      cost: Random.rand(1..1000)
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Room.create! valid_attributes
      get rooms_url
      expect(response).to be_successful
    end
  end
end
