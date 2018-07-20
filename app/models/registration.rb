class Registration < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :first_name, :last_name, :email, :phone, presence: true

  attr_accessor :stripeToken, :stripeEmail

  monetize :amount_cents
end
