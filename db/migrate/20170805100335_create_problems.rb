class CreateProblems < ActiveRecord::Migration[5.1]
  def change
    create_table :problems do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :description
      t.integer :version
      t.string :publish_status

      t.timestamps
    end
  end
end
