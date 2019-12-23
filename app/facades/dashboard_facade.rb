class DashboardFacade
  def initialize(current_user)
    @current_user = current_user
  end

  def organisations
    @organisations ||= Organisation.all
  end

  def new_organisation_form
    @new_organisation_form ||= NewOrganisationForm.new
  end
end
