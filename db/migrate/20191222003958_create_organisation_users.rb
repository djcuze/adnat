class CreateOrganisationUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :organisation_users do |t|
      t.belongs_to :organisation, null: false
      t.belongs_to :user, null: false
    end
  end
end
