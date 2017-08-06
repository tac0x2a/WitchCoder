class CreateCases < ActiveRecord::Migration[5.1]
  def change
    create_table :cases do |t|
      t.references :problem, foreign_key: true
      t.text :input
      t.text :expected

      t.timestamps
    end
  end
end
