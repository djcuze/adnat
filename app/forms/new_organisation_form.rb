class NewOrganisationForm < BaseForm
  attribute :name, String
  attribute :hourly_rate, String

  validates :name, :hourly_rate, presence: true

  private

  def persist
    Organisation.transaction do
      create_organisation
    end
  end

  def create_organisation
    @create_organisation ||= Organisation.create(
      name:                 name,
      hourly_rate_in_cents: hourly_rate
    )
  end
end
