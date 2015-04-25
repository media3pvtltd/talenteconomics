class CreateCoursesCourses < ActiveRecord::Migration

  def up
    create_table :refinery_courses do |t|
      t.string :place
      t.string :country
      t.datetime :held_on
      t.datetime :held_upto
      t.integer :brochure_id
      t.integer :photo_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-courses"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/courses/courses"})
    end

    drop_table :refinery_courses

  end

end
