class TasksController < ApplicationController

  def index
    completed_state = TaskState.find_by_name("complete")

    @tasks = Task.where.not(:task_state => completed_state)
  end

  def update
    task = Task.find(params[:id])
    completed_state = TaskState.find_by_name("complete")

    task.task_state = completed_state
    task.save!

    redirect_to shift_url(task.shift)
  end

end
