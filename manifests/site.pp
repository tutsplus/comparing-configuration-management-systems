node default {
  class { 'tp-cron-puppet': }
  # class { 'tp-rails-app::database': }
  # class { 'tp-rails-app::web':
  #   name => 'tutsplus',
  # }
}

node "database.localdomain" {
  class { 'tp-rails-app::database': }

  postgresql::server:pg_hba_rule { 'allow subnet access to postgresql':
    type => 'host',
    database => 'rails_production',
    user => 'rails',
    address => '192.168.246.0/24',
    auth_method => 'md5',
  }
}

node "web.localdomain" {
  class { 'tp-rails-app::web':
    name => 'tutsplus',
  }
}
