class AddJobIdToReports < ActiveRecord::Migration
  def change
    add_column :scouting_reports, :job_id, :string
    add_column :scouting_reports, :analyzed, :boolean, :default => false
  end
end
