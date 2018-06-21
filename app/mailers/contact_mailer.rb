class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.prayer_request.subject
  #
  def prayer_request(request)
    @request = request
    mail(to: "hogue.a@gmail.com", subject: "New Prayer Request")
  end
end
