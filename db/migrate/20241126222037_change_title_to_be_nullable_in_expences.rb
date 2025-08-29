class ChangeTitleToBeNullableInExpences < ActiveRecord::Migration[7.2]
  def change
    change_column_null :expences, :title, true
  end
end
