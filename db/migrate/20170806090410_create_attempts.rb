class CreateAttempts < ActiveRecord::Migration[5.1]
  def change
    create_table :attempts do |t|
      t.references :user, foreign_key: true
      t.references :problem, foreign_key: true
      t.string :language
      t.text :code
      t.string :result
      t.integer :answer_time

      t.timestamps
    end
  end
end
