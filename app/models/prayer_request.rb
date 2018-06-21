class PrayerRequest < ApplicationRecord
  belongs_to :user, optional: true

  def self.options
    [
      'In thoughts',
      'By email',
      'Over the phone',
      'In person at service',
      'In person by appointment'
    ]
  end
end
