class AddContactInfoToCommittees < ActiveRecord::Migration
  def change
    add_column :committees, :contact_info, :text
    add_column :committees, :website, :string
  end
end
