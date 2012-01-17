class AddFormDataToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :form_data, :text
  end
end
