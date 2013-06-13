class CreateScoutingControlTowers < ActiveRecord::Migration
  def change
    create_table :scouting_control_towers do |t|
      t.integer :region_id
      t.integer :constellation_id
      t.integer :solar_system_id
      t.integer :moon_id
      t.integer :control_tower_type_id
      
      t.integer :scouting_report_id

      t.timestamps
    end
  end
end
