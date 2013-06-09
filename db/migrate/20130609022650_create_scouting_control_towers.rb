class CreateScoutingControlTowers < ActiveRecord::Migration
  def change
    create_table :scouting_control_towers do |t|
      t.integer :region_id,             :null => false
      t.integer :constellation_id,      :null => false
      t.integer :solar_system_id,       :null => false
      t.integer :moon_id,               :null => false
      t.integer :control_tower_type_id, :null => false
      
      t.integer :scouting_report_id

      t.timestamps
    end
  end
end
