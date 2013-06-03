class CreateScoutingReports < ActiveRecord::Migration
  def change
    create_table :scouting_reports do |t|
      t.integer :star_id,     :null => false, :default => 0
      t.string :planet_ids

      t.timestamps
    end
  end
end
