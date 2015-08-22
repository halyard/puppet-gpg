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
  package { ['gnupg', 'gnupg-halyard']:
    require => Homebrew::Tap['halyard/formulae']
  }
  package { 'gpgtools-halyard':
    provider => 'brewcask',
    require  => Homebrew::Tap['halyard/casks']
  }
}
