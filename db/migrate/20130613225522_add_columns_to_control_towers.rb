class AddColumnsToControlTowers < ActiveRecord::Migration
  def change
    add_column  :scouting_control_towers, :control_tower_type_name, :string
    add_column  :scouting_control_towers, :moon_name, :string
  end
end
