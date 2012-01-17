class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.integer :applicant_id
      t.integer :committee_id

      t.timestamps
    end
    add_index :applications, :applicant_id
    add_index :applications, :committee_id
  end
end
