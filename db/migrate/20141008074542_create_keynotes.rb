class CreateKeynotes < ActiveRecord::Migration
  def change
    create_table :keynotes do |t|
      t.string :title
      t.string :place
      t.date :on

      t.timestamps
    end
  end
end
