class AddCorporationIdToControlTowers < ActiveRecord::Migration
  def change
    add_column  :scouting_control_towers, :corporation_id, :integer
  end
end
