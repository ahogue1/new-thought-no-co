class Event < ApplicationRecord
  has_many :registrations
  
  monetize :general_price_cents
  monetize :member_price_cents
  monetize :tithe_price_cents

  def event_type_enum
    %w(event class)
  end

  rails_admin do
    list do
      include_fields :id, :title, :start_date, :facilitator

      field :event_type do
        pretty_value { value.capitalize }
      end
    end

    include_all_fields
    field :event_type do
      pretty_value { value.capitalize }
    end
  end
end
