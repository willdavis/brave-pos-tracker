class AddStarHasManyPlanets < ActiveRecord::Migration
  def change
    change_table :planets do |t|
        t.references :star
    end
  end
end
