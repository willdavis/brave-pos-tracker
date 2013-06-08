class RemovePlanets < ActiveRecord::Migration
  def change
    drop_table :planets
  end
end
