#
# As a user can only belong to a single
# organisation at any given time, we need
# to allow them to leave their organisation
class LeaveOrganisationForm < BaseForm
  attribute :user_id, Integer
  attribute :organisation_id, Integer

  validates :user_id, :organisation_id, presence: true

  private

  def persist
    Organisation.transaction do
      leave_organisation
    end
  end

  def leave_organisation
    @leave_organisation ||= OrganisationUser.find_by(
      user_id: user_id, organisation_id: organisation_id
    )&.destroy
  end
end
