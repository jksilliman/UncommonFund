class AddCommitteeIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :committee_id, :integer
    add_index :questions, :committee_id
  end
end
