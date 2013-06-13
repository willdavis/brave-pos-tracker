class UpdateReportsWithSolarSytemName < ActiveRecord::Migration
  def up
    rename_column :scouting_reports, :star_id, :solar_system_id
    add_column :scouting_reports, :solar_system_name, :string
  end

  def down
    rename_column :scouting_reports, :solar_system_id, :star_id
    remove_column :scouting_reports, :solar_system_name
  end
end
