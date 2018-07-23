class AddContactToGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :contact, :string
  end
end
