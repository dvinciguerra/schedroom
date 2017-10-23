class CreateRoomSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :room_schedules do |t|
      t.integer :user_id
      t.integer :room_id
      t.string :description
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end

		add_index :room_schedules, [:starts_at], unique: true
  end
end
