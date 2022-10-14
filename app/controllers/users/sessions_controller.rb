# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    def create
      super
      flash.delete :notice
      flash[:success] = 'Signed up successfully.'
    end

    def destroy
      super
      flash.delete :notice
      flash[:success] = 'Signed out successfully.'
    end
  end
end
