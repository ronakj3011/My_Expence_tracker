class AddUserToExpences < ActiveRecord::Migration[6.0]
  def change
    add_reference :expences, :user, foreign_key: true, null: true  # Temporarily allow nulls
  end
end
