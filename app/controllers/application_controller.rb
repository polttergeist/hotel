class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  include Pundit::Authorization
end
