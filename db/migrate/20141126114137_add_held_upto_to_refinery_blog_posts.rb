class AddHeldUptoToRefineryBlogPosts < ActiveRecord::Migration
  def change
    add_column :refinery_courses, :held_upto, :datetime
  end
end
