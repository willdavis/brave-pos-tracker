class AddPublishedToSoutingReport < ActiveRecord::Migration
  def change
    add_column :scouting_reports, :published, :boolean, :default => false
  end
end
