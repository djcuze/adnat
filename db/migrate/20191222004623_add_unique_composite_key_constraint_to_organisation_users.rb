class AddUniqueCompositeKeyConstraintToOrganisationUsers < ActiveRecord::Migration[5.2]
  def change
    ActiveRecord::Base.connection.execute(
      <<-SQL
        ALTER TABLE organisation_users
        ADD CONSTRAINT unique_index_organisation_users 
        UNIQUE (user_id, organisation_id);
    SQL
    )
  end
end
