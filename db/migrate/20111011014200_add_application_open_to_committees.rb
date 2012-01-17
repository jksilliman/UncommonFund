class AddApplicationOpenToCommittees < ActiveRecord::Migration
  def change
    add_column :committees, :applications_open, :boolean, :default => true
  end
end
