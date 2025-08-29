class RenameModeToModeInExpences < ActiveRecord::Migration[7.0]
  def change
    rename_column :expences, :Mode, :mode
  end
end
