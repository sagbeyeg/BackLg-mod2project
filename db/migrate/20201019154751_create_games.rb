class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name
      t.float :rating
      t.string :genre
      t.string :esrb_rating
      t.integer :rating_count

      t.timestamps
    end
  end
end
