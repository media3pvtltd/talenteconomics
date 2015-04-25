class CreateAvgs < ActiveRecord::Migration
  def change
    create_table :avgs do |t|
      t.integer :alpha
      t.integer :beta
      t.integer :gamma
      t.integer :delta
      t.integer :omega
      t.integer :epsilon
      t.integer :zeta
      t.integer :eta
      t.integer :theta
      t.integer :iota
      t.integer :lambda
      t.integer :survey_id

      t.timestamps
    end
  end
end
