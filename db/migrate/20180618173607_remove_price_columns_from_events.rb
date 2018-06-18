class RemovePriceColumnsFromEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :general_price
    remove_column :events, :member_price
    remove_column :events, :tithe_price
  end
end
