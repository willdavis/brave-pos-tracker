class CreateControlTowers < ActiveRecord::Migration
  def change
    create_table :control_towers do |t|
      t.integer :corporation_id
      t.integer :type_id
      t.integer :moon_id
      t.string :moon_name
      t.integer :solar_system_id
      t.integer :constellation_id
      t.integer :region_id

      t.timestamps
    end
    
    add_index :control_towers, :moon_id, :unique => true
  end
end
