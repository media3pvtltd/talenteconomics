class AddPdfIdToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :pdf_id, :integer
  end
end
