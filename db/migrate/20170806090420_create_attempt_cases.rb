class CreateAttemptCases < ActiveRecord::Migration[5.1]
  def change
    create_table :attempt_cases do |t|
      t.references :attempt, foreign_key: true
      t.references :case, foreign_key: true
      t.integer :exec_time
      t.integer :exec_mem
      t.string :result

      t.timestamps
    end
  end
end
