# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def new
     super
  end

  def create
    super
    flash.delete :notice
    flash[:success] = "Signed up successfully."
  end

  def destroy
    super
    flash.delete :notice
    flash[:success] = "Signed out successfully."
  end
end
