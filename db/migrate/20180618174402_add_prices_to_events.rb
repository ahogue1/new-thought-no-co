class AddPricesToEvents < ActiveRecord::Migration[5.1]
  def change
    add_monetize :events, :general_price, currency: { present: false }
    add_monetize :events, :member_price, currency: { present: false }
    add_monetize :events, :tithe_price, currency: { present: false }
  end
end
