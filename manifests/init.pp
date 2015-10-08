# == Class: gpg
#
# Full description of class gpg here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class gpg (
) {
  package { 'gnupg-halyard':
    require => Homebrew::Tap['halyard/formulae']
  }
  package { 'gpgtools-halyard':
    provider => 'brewcask',
    require  => Homebrew::Tap['halyard/casks']
  }
  file { '/usr/local/bin/gpg':
    ensure  => 'absent',
    require => Package['gpgtools-halyard']
  }
  file { "/Users/${::boxen_user}/.gnupg":
    ensure  => directory,
    owner   => $::boxen_user,
    mode    => 'u+rwX,go-rwx',
    require => Package['gpgtools-halyard']
  }
}
