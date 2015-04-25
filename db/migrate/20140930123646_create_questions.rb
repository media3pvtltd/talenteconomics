class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :section_id
      t.integer :rank
      t.string :text
      t.string :low_term
      t.string :high_term

      t.timestamps
    end
  end
end
