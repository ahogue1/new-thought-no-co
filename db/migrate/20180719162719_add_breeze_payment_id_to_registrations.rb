class AddBreezePaymentIdToRegistrations < ActiveRecord::Migration[5.1]
  def change
    add_column :registrations, :breeze_payment_id, :string
  end
end
