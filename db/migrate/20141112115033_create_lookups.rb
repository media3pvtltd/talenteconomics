class CreateLookups < ActiveRecord::Migration
  def change
    create_table :lookups do |t|
      t.string :grp
      t.string :name
      t.integer :rank
      t.boolean :exists

      t.timestamps
    end
  end
end
