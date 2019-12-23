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
      cancel_shifts_for_user
      leave_organisation
    end
  end

  def cancel_shifts_for_user
    Shift.where(user_id: user_id).delete_all
  end

  def leave_organisation
    @leave_organisation ||= OrganisationUser.find_by(
      user_id: user_id, organisation_id: organisation_id
    )&.destroy
  end
end
