class tp-rails-app::database {
  class { 'postgresql::server': }

  postgresql::server::db { 'rails_production':
    listen_addresses => '0.0.0.0',
    user => 'rails',
    password => postgresql_password('rails', 'password'),
  }
}
