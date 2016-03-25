class TasksController < ApplicationController

  def index
    completed_state = TaskState.find_by_name("complete")

    #TaskTemplate.all.each do |t|
    #  if t.tasks.nil? || t.tasks.where(:task_state => completed_state).nil?
    #    i = t.task.build
    #    i.save!
    #  end
    #end

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
