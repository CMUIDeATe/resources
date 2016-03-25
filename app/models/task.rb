class Task < ActiveRecord::Base
  belongs_to :task_template
  belongs_to :task_state
end
