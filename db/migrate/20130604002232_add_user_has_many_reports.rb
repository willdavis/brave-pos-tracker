class AddUserHasManyReports < ActiveRecord::Migration
  def change
    change_table :scouting_reports do |t|
      t.references :user
    end
  end
end
