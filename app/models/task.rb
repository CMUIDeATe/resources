class Task < ActiveRecord::Base
  belongs_to :task_template
  belongs_to :task_state
  belongs_to :shift
end
