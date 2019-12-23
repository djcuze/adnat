class DashboardFacade
  def initialize(current_user)
    @current_user = current_user
  end

  def current_organisation
    @current_organisation ||= @current_user.organisations.first
  end

  def organisations
    @organisations ||= Organisation.all
  end

  def new_organisation_form
    @new_organisation_form ||= NewOrganisationForm.new
  end
end
