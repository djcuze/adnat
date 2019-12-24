# Readme

* Given more time, I would like to have completed the following: 

1. A class to convert the hourly rate from cents, to dollars
    - I opted to save the hourly rate in the database in cents
2. Use `remote: true` ajax calls to render form errors and
   submit forms
3. Adding organisations to shifts to allow for users to be members
   of more than one organisation
4. The addition of database-level constraints to ensure shift
   times are valid _ie. finish time > (start_time + break_length)_
5. Adding an `active` boolean column to `organisation_users` to flag
   as false instead of deleting the record, when leaving an organisation
      - This would allow for shifts to be stored and given back to
        the user should they re-join a previously left organisation.
6. Proper implementation of the `FactoryBot` gem to reduce the time
   spent writing specs
