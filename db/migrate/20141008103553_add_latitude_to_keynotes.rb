class AddLatitudeToKeynotes < ActiveRecord::Migration
  def change
    add_column :keynotes, :latitude, :string
    add_column :keynotes, :longitude, :string
  end
end
