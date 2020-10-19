class CreateGameSystems < ActiveRecord::Migration[6.0]
  def change
    create_table :game_systems do |t|
      t.integer :game_id
      t.integer :system_id

      t.timestamps
    end
  end
end
