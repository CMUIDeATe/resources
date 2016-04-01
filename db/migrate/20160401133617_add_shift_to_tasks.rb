class AddShiftToTasks < ActiveRecord::Migration
  def change
    add_reference :tasks, :shift, index: true, foreign_key: true
  end
end
