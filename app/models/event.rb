class Event < ApplicationRecord
  has_many :registrations

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

    field :credits do
      label "Credits available?"
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

    exclude_fields :registrations

  end

  def prices_collection
    [
      ["#{ActionController::Base.helpers.humanized_money_with_symbol(general_price)} - General Price", general_price_cents],
      ["#{ActionController::Base.helpers.humanized_money_with_symbol(member_price)} - Price for Members", member_price_cents],
      ["#{ActionController::Base.helpers.humanized_money_with_symbol(tithe_price)} - Price for Tithing Members", tithe_price_cents]
    ]
  end
end
