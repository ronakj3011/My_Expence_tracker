class RenameAmountColumnInExpences < ActiveRecord::Migration[7.2]
  def change
    rename_column :expences, :Amount, :amount
  end
end
