class CreateTaskNotes < ActiveRecord::Migration
  def change
    create_table :task_notes do |t|
      t.references :task, index: true, foreign_key: true
      t.string :notes

      t.timestamps null: false
    end
  end
end
