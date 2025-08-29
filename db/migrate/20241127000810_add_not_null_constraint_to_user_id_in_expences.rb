class AddNotNullConstraintToUserIdInExpences < ActiveRecord::Migration[6.0]
  def change
    change_column_null :expences, :user_id, false
  end
end
