module Organisations
  class EditFacade
    def initialize(params)
      @params = params
    end

    def form
      @form ||= EditOrganisationForm.new(organisation.attributes)
    end

    def organisation
      @organisation ||= Organisation.find(@params[:id])
    end
  end
end
