class ShiftsController < ApplicationController
  def index
    @facade ||= Shifts::IndexFacade.new(current_user)
  end

  def create
    @facade ||= Shifts::CreateFacade.new(strong_params)
    return unless @facade.form.save

    redirect_to user_shifts_path(@facade.form.user_id)
  end

  private

  def strong_params
    params.require(:new_shift_form)
          .permit(:shift_date, :break_length_in_minutes)
          .merge(user_id: params[:user_id])
          .merge(
            shift_start:  "#{params[:new_shift_form]['shift_start(4i)']}:#{params[:new_shift_form]['shift_start(5i)']}",
            shift_finish: "#{params[:new_shift_form]['shift_finish(4i)']}:#{params[:new_shift_form]['shift_finish(5i)']}"
          )
  end
end
