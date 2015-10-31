node default {
  class { 'nginx': }

  nginx::resource::vhost { 'default':
    listen_options => 'default',
    www_root => '/usr/share/nginx/html',
  }
}
