class AddDateToExpences < ActiveRecord::Migration[7.2]
  def change
    add_column :expences, :date, :date
  end
end
