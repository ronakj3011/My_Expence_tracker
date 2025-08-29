class ChangeAmountToDecimalInExpences < ActiveRecord::Migration[7.2]
  def change
    change_column :expences, :amount, :decimal, precision: 10, scale: 2
  end  
end
