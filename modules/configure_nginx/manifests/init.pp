# A description of what this class does
#
# configures the puppet-nginx module with basic configuration and sets up a static site with content.
#
# @example
#   include configure_nginx
class configure_nginx {
  file { '/var/www/mini-proj-sample-site':
    ensure => directory,
    mode   => '0644',
    owner  => www-data,
    group  => www-data,
  }
  file { '/var/www/mini-proj-sample-site/index.html':
    ensure  => file,
    mode    => '0644',
    owner   => www-data,
    group   => www-data,
    content => 'Automation for the People',
  }

  nginx::resource::server { 'mini-proj-simple-site':
    ensure   => present,
    www_root => '/var/www/mini-proj-simple-site',
  }
}
