class RenameColumnToAvgs < ActiveRecord::Migration
 def change
 	change_column :avgs, :alpha, :float
 	change_column :avgs, :beta, :float
 	change_column :avgs, :gamma, :float
 	change_column :avgs, :delta, :float
 	change_column :avgs, :omega, :float
 	change_column :avgs, :epsilon, :float
 	change_column :avgs, :zeta, :float
 	change_column :avgs, :eta, :float
 	change_column :avgs, :theta, :float
 	change_column :avgs, :iota, :float
 	change_column :avgs, :lambda, :float
 end
end
