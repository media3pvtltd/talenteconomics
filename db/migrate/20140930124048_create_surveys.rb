class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :organization
      t.string :title
      t.string :assessed_organization
      t.integer :industry
      t.integer :region
      t.integer :role

      t.timestamps
    end
  end
end
