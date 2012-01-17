class AddSectionIdToCommittees < ActiveRecord::Migration
  def change
    add_column :committees, :section_id, :integer
    add_index :committees, :section_id
  end
end
