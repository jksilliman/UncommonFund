class CreateSiteContents < ActiveRecord::Migration
  def change
    create_table :site_contents do |t|
      t.string :name
      t.text :text
      t.text :description

      t.timestamps
    end
  end
end
