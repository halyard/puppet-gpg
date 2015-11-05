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
  package { ['gnupg-halyard', 'gnupg-legacy-halyard']:
    require => Homebrew::Tap['halyard/formulae']
  }
  package { 'gpgtools-halyard':
    provider => 'brewcask',
    require  => Homebrew::Tap['halyard/casks']
  }

  $bad_files = [
    '/usr/local/bin/gpg',
    '/Library/LaunchAgents/org.gpgtools.macgpg2.fix.plist',
    '/Library/LaunchAgents/org.gpgtools.macgpg2.shutdown-gpg-agent.plist'
  ]
  file { $bad_files:
    ensure  => absent,
    require => Package['gpgtools-halyard']
  }

  file { "/Users/${::boxen_user}/.gnupg":
    ensure  => directory,
    owner   => $::boxen_user,
    group   => 'staff'
    mode    => 'u+rwX,go-rwx',
    require => Package['gpgtools-halyard']
  }
}
