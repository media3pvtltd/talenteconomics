class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :heading
      t.string :instruction
      t.string :summary_heading
      t.integer :rank
      t.string :low_term
      t.string :high_term

      t.timestamps
    end
  end
end
