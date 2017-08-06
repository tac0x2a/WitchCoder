class AddTimestumpToAttempts < ActiveRecord::Migration[5.1]
  def change
    add_column :attempts, :attempted_at, :datetime
    add_column :attempts, :submitted_at, :datetime
  end
end
