class AddDescriptionToExpenses < ActiveRecord::Migration[7.2]
  def change
    add_column :expences, :description, :string
  end
end
