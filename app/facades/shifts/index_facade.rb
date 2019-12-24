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

    private

    def fetch_shifts
      @fetch_shifts ||= Shift.includes(:user)
                             .where(user_id: organisation.user_ids)
    end
  end
end
