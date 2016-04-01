class ShiftsController < ApplicationController

  def show
    @shift = Shift.find(params[:id])
  end

  def create
    @shift = Shift.new(shift_params)
    @shift.save!

    completed_state = TaskState.find_by_name("complete")
    incompleted_state = TaskState.find_by_name("incomplete")

    # Instantiate all tasks into this shift
    TaskTemplate.all.each do |t|
      i = t.tasks.build(:task_state => incompleted_state, :shift => @shift)
      i.save!
    end

    redirect_to action: :show, id: @shift
  end

  private
  def shift_params
    params.permit(:start_at, :end_at)
  end

end
