class ApproveMailer < ApplicationMailer
  default from: "hotel_california@noveo.com"

  def approve_mail
    @type = params[:type]
    mail(to: params[:email], subject: "Your #{@type} has been approved!")
  end
end
