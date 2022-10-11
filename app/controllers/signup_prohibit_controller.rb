# frozen_string_literal: true

class SignupProhibitController < ApplicationController
  def index
    head :forbidden
  end

  def create
    head :forbidden
  end
end
