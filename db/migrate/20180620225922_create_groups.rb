class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.text :description
      t.string :schedule

      t.timestamps
    end
  end
end
