class CreateTaskCategories < ActiveRecord::Migration
  def change
    create_table :task_categories do |t|
      t.string :name
      t.string :label

      t.timestamps null: false
    end
  end
end
