class ShiftsController < ApplicationController
  def index
    @facade ||= Shifts::IndexFacade.new(current_user)
  end
end
