# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/contact_mailer/prayer_request
  def prayer_request
    request = PrayerRequest.last
    ContactMailer.prayer_request(request)
  end

end
