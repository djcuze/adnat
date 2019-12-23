class Factories
  class << self
    def user(email: 'test@example.com', password: 'password', name: 'Rickett Bullrush')
      User.create(email: email, password: password, name: name)
    end

    def organisation(name: 'Foo Pty Ltd', hourly_rate_in_cents: 2225)
      Organisation.create(name: name, hourly_rate_in_cents: hourly_rate_in_cents)
    end
  end
end
