class CreatePrayerRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :prayer_requests do |t|
      t.string :name
      t.string :email
      t.string :method
      t.string :phone
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
