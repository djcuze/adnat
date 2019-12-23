class AddNullConstraintsToOrganisations < ActiveRecord::Migration[5.2]
  def change
    change_column_null :organisations, :hourly_rate_in_cents, false
    change_column_null :organisations, :name, false
  end
end
