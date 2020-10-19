class CreateSystemUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :system_users do |t|
      t.integer :system_id
      t.integer :user_id

      t.timestamps
    end
  end
end
