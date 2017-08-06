class AddReferenceToAttempt < ActiveRecord::Migration[5.1]
  def change
    add_reference :attempts, :attempt_cases, foreign_key: true
  end
end
