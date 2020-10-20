class AddNotNullConstraintTUserIdFromReviews < ActiveRecord::Migration[6.0]
  def change
    change_column :reviews, :user_id, :integer, null: false
  end
end
