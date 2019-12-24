module Shifts
  class IndexFacade
    def initialize(current_user)
      @current_user = current_user
    end

    def shifts
      @shifts ||= SimpleShiftDecorator.wrap(fetch_shifts)
    end

    def organisation
      @organisation ||= @current_user.organisations.first
    end

    def form
      @form ||= NewShiftForm.new
    end

    def calculate_shift_cost(shift)
      CalculateShiftCost.call(shift, organisation)
    end

    private

    def fetch_shifts
      @fetch_shifts ||= Shift.includes(:user)
                             .where(user_id: organisation.user_ids)
    end
  end
end
