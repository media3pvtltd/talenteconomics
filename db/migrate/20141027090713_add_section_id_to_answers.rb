class AddSectionIdToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :section_id, :integer
  end
end
