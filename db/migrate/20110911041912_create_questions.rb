class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :type
      t.text :text
      t.boolean :for_nominator
      t.boolean :for_applicant

      t.timestamps
    end
  end
end
