class AddActualToAttemptCases < ActiveRecord::Migration[5.1]
  def change
    add_column :attempt_cases, :actual, :text
  end
end
