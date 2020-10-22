class AddCompletionStatusToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :completion_status, :string
  end
end
