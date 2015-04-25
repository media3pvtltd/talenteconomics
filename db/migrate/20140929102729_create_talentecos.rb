class CreateTalentecos < ActiveRecord::Migration
  def change
    create_table :talentecos do |t|
      t.string :email, :null => false
      t.string :encrypted_password, :null => false, :default => ''

      t.string :firstname
      t.string :lastname
      t.string :username

      t.timestamps
    end

    add_index :talentecos, :email, :unique => true
  end
end
