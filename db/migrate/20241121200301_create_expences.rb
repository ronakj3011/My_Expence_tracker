class CreateExpences < ActiveRecord::Migration[7.2]
  def change
    create_table :expences do |t|
      t.string :title, null: false
      t.string :Amount, null: false
      t.string :Mode, null: false
      t.timestamps
    end
  end
end
