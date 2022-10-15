require 'rails_helper'

RSpec.describe "SignupProhibit", type: :request do
  describe "GET /users_sign_up" do
    it "doesn't let you in" do
      get new_user_registration_path
      expect(response).to have_http_status(403)
    end
  end

  describe "POST /users_sign_up" do
    it "doesn't let you in" do
      get users_sign_up_path
      expect(response).to have_http_status(403)
    end
  end
end
