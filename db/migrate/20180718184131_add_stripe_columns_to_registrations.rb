class AddStripeColumnsToRegistrations < ActiveRecord::Migration[5.1]
  def change
    add_monetize :registrations, :amount, currency: { present: false }
    add_column :registrations, :state, :string
    add_column :registrations, :payment, :jsonb
  end
end
