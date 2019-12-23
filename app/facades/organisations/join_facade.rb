module Organisations
  class JoinFacade
    def initialize(params)
      @params = params
    end

    def form
      @form ||= JoinOrganisationForm.new(@params)
    end
  end
end
