class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :task_template, index: true, foreign_key: true
      t.references :task_state, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
