class AddFormDataToNominations < ActiveRecord::Migration
  def change
    add_column :nominations, :form_data, :text
  end
end
