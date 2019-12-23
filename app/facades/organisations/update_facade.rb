module Organisations
  class UpdateFacade
    def initialize(params)
      @params = params
    end

    def form
      @form ||= EditOrganisationForm.new(@params)
    end
  end
end
