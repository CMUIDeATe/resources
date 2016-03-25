class CreateTaskTemplates < ActiveRecord::Migration
  def change
    create_table :task_templates do |t|
      t.string :description
      t.references :task_location, index: true, foreign_key: true
      t.references :task_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
