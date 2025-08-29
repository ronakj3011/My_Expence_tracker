class ChangeModeNullConstraintInExpences < ActiveRecord::Migration[7.2]
  def change
    change_column_null :expences, :Mode, true
  end
end
