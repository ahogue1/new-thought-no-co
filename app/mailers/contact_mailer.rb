class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.prayer_request.subject
  #
  def prayer_request(request)
    @request = request
    mail(to: "info@newthoughtnoco.org", subject: "New Prayer Request")

  end

  def event_registration(registration)
    @registration = registration
    @event = registration.event
    mail(to: "info@newthoughtnoco.org", subject: "New #{@event.event_type.capitalize} Registration")
  end
end
