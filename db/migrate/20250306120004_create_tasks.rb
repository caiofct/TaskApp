class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.text :description, null: false
      t.boolean :completed, null: false, default: false
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end

    add_index :tasks, :completed
  end
end
