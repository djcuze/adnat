class EditOrganisationForm < BaseForm
  attribute :id, Integer
  attribute :name, String
  attribute :hourly_rate_in_cents, Integer

  validates :id, :name, :hourly_rate_in_cents, presence: true

  private

  def persist
    Organisation.transaction do
      update_organisation
    end
  end

  def update_organisation
    @update_organisation ||= Organisation.update(
      id,
      name:                 name,
      hourly_rate_in_cents: hourly_rate_in_cents
    )
  end
end
