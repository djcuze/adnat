class JoinOrganisationForm < BaseForm
  attribute :user_id, Integer
  attribute :organisation_id, Integer

  validates :user_id, :organisation_id, presence: true
  validate :organisation_not_already_joined?

  private

  def persist
    Organisation.transaction do
      add_user_to_organisation
    end
  end

  def add_user_to_organisation
    @add_user_to_organisation ||= OrganisationUser.create(attributes)
  end

  def organisation_not_already_joined?
    return unless OrganisationUser.exists?(attributes)

    errors.add(:base, I18n.t('organisation.join.error'))
  end
end
