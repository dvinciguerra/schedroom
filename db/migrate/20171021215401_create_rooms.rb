class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :description
      t.string :location

      t.timestamps
    end

		add_index :rooms, [:name], unique: true
  end
end
