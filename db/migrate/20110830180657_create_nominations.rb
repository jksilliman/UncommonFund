class CreateNominations < ActiveRecord::Migration
  def change
    create_table :nominations do |t|
      t.integer :committee_id, :null => false
      t.integer :nominator_id, :null => false
      t.integer :nominee_id, :null => false

      t.timestamps
    end
    add_index :nominations, :committee_id
    add_index :nominations, :nominator_id
    add_index :nominations, :nominee_id
  end
end
