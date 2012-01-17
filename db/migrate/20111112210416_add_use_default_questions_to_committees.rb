class AddUseDefaultQuestionsToCommittees < ActiveRecord::Migration
  def change
    add_column :committees, :use_default_questions, :boolean, :default => true
  end
end
