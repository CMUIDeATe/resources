class TaskTemplate < ActiveRecord::Base
  belongs_to :task_location
  belongs_to :task_category

  has_many :tasks
end
