class AddMoonIdIndexToControlTowers < ActiveRecord::Migration
  def change
    add_index :scouting_control_towers, :moon_id, :unique => true
  end
end
