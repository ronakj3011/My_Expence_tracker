class RemoveNotnullConstrain < ActiveRecord::Migration[7.2]
  def change
    change_column_null :expences, :user_id, false
  end
end
