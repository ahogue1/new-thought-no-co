class PrayerRequest < ApplicationRecord
  belongs_to :user, optional: true
  validates :content, presence: true

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
