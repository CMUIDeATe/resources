class Admin::TasksController < ApplicationController

  def index
    @templates = TaskTemplate.all
  end

  def create
    @template = TaskTemplate.new(task_template_params)
    @task = @template.tasks.build
    @task.save!
    redirect_to action: :index
  end

  private
  def task_template_params
    params.require(:task_template).permit(:description)
  end

end
