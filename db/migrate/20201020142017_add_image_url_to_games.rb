class AddImageUrlToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :image_url, :string
  end
end
