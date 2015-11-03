node default {
  class { 'tp-cron-puppet': }
  # class { 'tp-rails-app::database': }
  # class { 'tp-rails-app::web':
  #   name => 'tutsplus',
  # }
}

node database.localdomain {
  class { 'tp-rails-app::database': }
}

node web.localdomain {
  class { 'tp-rails-app::web':
    name => 'tutsplus',
  }
}
