name 'web'
description 'Web and application server'
run_list [
  "recipe[rvm::system]",
  "recipe[postgresql::client]",
  "recipe[nodejs]",
  "recipe[nginx_passenger]",
  "recipe[rails_app::web]"
]
default_attributes({
  nginx_passenger: {
    ruby: "/usr/local/rvm/wrappers/default/ruby"
  },
  rails_app: {
    location: "/vagrant"
  },
  rvm: {
    installer_flags: "head",
    default_ruby: "2.2",
    install_rubies: true,
    group_users: ["vagrant"]
  }
})
