module Shifts
  class CreateFacade
    def initialize(params)
      @params = params
    end

    def form
      @form ||= NewShiftForm.new(@params)
    end
  end
end
