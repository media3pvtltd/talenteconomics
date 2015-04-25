class AddSurveyIdToDelayedJobs < ActiveRecord::Migration
  def change
  	add_column :delayed_jobs, :survey_id, :integer
  end
end
