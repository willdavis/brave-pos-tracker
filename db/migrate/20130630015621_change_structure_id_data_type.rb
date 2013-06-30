class ChangeStructureIdDataType < ActiveRecord::Migration
  def up
    change_column :scouting_control_towers, :structure_ids, :text, :limit => nil
  end

  def down
    change_column :scouting_control_towers, :structure_ids, :string
  end
end
