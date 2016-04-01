class TasksController < ApplicationController

  def index
    completed_state = TaskState.find_by_name("complete")
    incompleted_state = TaskState.find_by_name("incomplete")

    # Instantiate all tasks not yet instantiated
    TaskTemplate.all.each do |t|
      if t.tasks.nil? || t.tasks.where.not(:task_state => completed_state).size == 0
        i = t.tasks.build(:task_state => incompleted_state)
        i.save!
      end
    end

    @tasks = Task.where.not(:task_state => completed_state)
  end

  def update
    task = Task.find(params[:id])
    completed_state = TaskState.find_by_name("complete")

    task.task_state = completed_state
    task.save!

    redirect_to action: :index
  end

end
