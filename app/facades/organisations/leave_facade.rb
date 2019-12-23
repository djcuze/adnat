module Organisations
  class LeaveFacade
    def initialize(params)
      @params = params
    end

    def form
      @form ||= LeaveOrganisationForm.new(@params)
    end
  end
end
