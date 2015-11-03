class tp-rails-app::web (
    $name = 'rails'
) {
  class { 'postgresql::client': }
  class { 'postgresql::lib::devel': }

  class { 'rvm':
    system_rubies => {
      '2.2' => {
        ensure => present,
        default_use => true,
      },
    },
    system_users => ['vagrant'],
    rvm_gems => {
      'bundler' => {
        ensure => 'latest',
        ruby_version => '2.2',
      },
    },
  }

  class { 'nodejs': }

  class { 'nginx': }

  nginx::resource::vhost { $name:
    www_root => '/vagrant/public',
    listen_options => 'default',
    use_default_location => false,
    vhost_cfg_append => {
      passenger_enabled => 'on',
      passenger_ruby => '/usr/local/rvm/wrappers/default/ruby',
    },
  }
}
