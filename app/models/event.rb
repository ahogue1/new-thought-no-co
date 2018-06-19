class Event < ApplicationRecord
  has_many :registrations
  
  monetize :general_price_cents
  monetize :member_price_cents
  monetize :tithe_price_cents

  rails_admin do
    list do
      include_fields :id, :title, :start_date, :facilitator, :event_type
    end
  end
end
