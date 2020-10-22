class AddImageUrlToSystems < ActiveRecord::Migration[6.0]
  def change
    add_column :systems, :image_url, :string
  end
end
