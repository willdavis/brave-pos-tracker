class AddStructureIdsToControlTowers < ActiveRecord::Migration
  def change
    add_column  :scouting_control_towers, :structure_ids, :string
  end
end
