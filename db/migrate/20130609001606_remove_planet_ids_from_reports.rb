class RemovePlanetIdsFromReports < ActiveRecord::Migration
  def change
    remove_column :scouting_reports, :planet_ids
  end
end
