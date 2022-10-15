class PagesController < ApplicationController
  def index
    @random_images = ActiveStorage::Attachment.where('id > 0').limit(3)
  end
end
