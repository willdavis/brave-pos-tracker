class UpdateReportsWithSolarSytemName < ActiveRecord::Migration
  def up
    rename_column :scouting_reports, :star_id, :solar_system_id
  end

  def down
    rename_column :scouting_reports, :solar_system_id, :star_id
  end
end
