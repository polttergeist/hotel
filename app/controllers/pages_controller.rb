# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    @images = ActiveStorage::Attachment.first(3)
  end
end
