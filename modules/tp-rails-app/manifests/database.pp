class tp-rails-app::database {
  class { 'postgresql::server': }

  postgresql::server::db { 'rails_production':
    user => 'rails',
    password => postgresql_password('rails', 'password'),
  }
}
