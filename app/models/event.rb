class Event < ApplicationRecord
  has_many :registrations

  validates :end_date, :start_date, :event_type, presence: true
  validates :general_price_cents, :member_price_cents, :tithe_price_cents, numericality: { greater_than_or_equal_to: 50 }

  monetize :general_price_cents
  monetize :member_price_cents
  monetize :tithe_price_cents

  def event_type_enum
    %w(event class)
  end

  def credits_enum
    %w(Yes No)
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

    field :schedule do
      label "Schedule (ie. Mondays from 5 - 6pm)"
    end

    field :general_price_cents do
      label "General Price in Cents- ie: for $10 enter: 1000)"
    end

     field :member_price_cents do
      label "Member Price in Cents (no decimal)"
    end

     field :tithe_price_cents do
      label "Tithing Member Price in Cents (no decimal)"
    end

    exclude_fields :registrations, :credits

  end

  def prices_collection
    [
      ["#{ActionController::Base.helpers.humanized_money_with_symbol(general_price)} - General Price", general_price_cents],
      ["#{ActionController::Base.helpers.humanized_money_with_symbol(member_price)} - Price for Members", member_price_cents],
      ["#{ActionController::Base.helpers.humanized_money_with_symbol(tithe_price)} - Price for Tithing Members", tithe_price_cents]
    ]
  end
end
