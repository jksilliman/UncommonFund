class CreateSiteContents < ActiveRecord::Migration
  def change
    create_table :site_contents do |t|
      t.string :name
      t.text :text

      t.timestamps
    end
  end
end
