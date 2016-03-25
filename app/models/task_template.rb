class TaskTemplate < ActiveRecord::Base
  has_many :tasks
  belongs_to :task_location
  belongs_to :task_category

  has_many :tasks
end
