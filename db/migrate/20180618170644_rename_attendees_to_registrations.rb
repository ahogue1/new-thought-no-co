class RenameAttendeesToRegistrations < ActiveRecord::Migration[5.1]
  def change
    rename_table :attendees, :registrations
  end
end
