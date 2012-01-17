class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :category_id
      t.text :description

      t.timestamps
    end
    add_index :projects, :category_id
  end
end
