class CreateReinforcementTimers < ActiveRecord::Migration
  def change
    create_table :reinforcement_timers do |t|
      t.references :control_tower
      t.datetime :expires_at

      t.timestamps
    end
  end
end
