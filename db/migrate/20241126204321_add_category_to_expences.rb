class AddCategoryToExpences < ActiveRecord::Migration[7.2]
  def change
    add_column :expences, :category, :string
  end
end
