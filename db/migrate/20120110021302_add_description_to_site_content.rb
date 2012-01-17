class AddDescriptionToSiteContent < ActiveRecord::Migration
  def change
    add_column :site_contents, :description, :text
  end
end
