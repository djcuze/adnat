class OrganisationsController < ApplicationController
  def create
    @form ||= NewOrganisationForm.new(new_organisation_params)
    return unless @form.save

    redirect_to root_path
  end

  def edit
    @facade ||= ::Organisations::EditFacade.new(params)
  end

  def update
    @facade ||= ::Organisations::UpdateFacade.new(edit_organisation_params)
    return unless @facade.form.save

    redirect_to root_path
  end

  private

  def new_organisation_params
    params.require(:new_organisation_form)
          .permit(:name, :hourly_rate)
  end

  def edit_organisation_params
    params.require(:edit_organisation_form)
          .permit(:name, :hourly_rate_in_cents)
          .merge(id: params[:id])
  end
end
