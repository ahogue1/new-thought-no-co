class Event < ApplicationRecord
  has_many :registrations
  
  monetize :general_price_cents
  monetize :member_price_cents
  monetize :tithe_price_cents
end
