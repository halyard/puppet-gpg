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
  package { ['gnupg', 'gnupg-halyard']: }
  package { 'gpgtools-halyard':
    provider => 'brewcask'
  }
}
