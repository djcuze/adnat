module Shifts
  class IndexFacade
    def initialize(current_user)
      @current_user = current_user
    end

    def shifts
      @shifts ||= Shift.where(user_id: organisation.user_ids)
    end

    def organisation
      @organisation ||= @current_user.organisations.first
    end
  end
end
