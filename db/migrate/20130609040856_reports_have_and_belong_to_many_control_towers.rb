class ReportsHaveAndBelongToManyControlTowers < ActiveRecord::Migration
  def self.up
    create_table :control_towers_reports, :id => false do |t|
      t.references :control_tower,:report
    end
    
    remove_column :scouting_control_towers, :scouting_report_id
  end
 
  def self.down
    add_column :scouting_control_towers, :scouting_report_id, :integer
    drop_table :control_towers_reports
  end
end
