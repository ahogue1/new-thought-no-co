class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.integer :general_price
      t.integer :member_price
      t.integer :tithe_price
      t.integer :seats
      t.string :facilitator
      t.date :start_date
      t.date :end_date
      t.text :description
      t.string :title
      t.string :credits
      t.string :schedule

      t.timestamps
    end
  end
end
