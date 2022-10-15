# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'hotel_california@noveo.com'
  layout 'mailer'
end
