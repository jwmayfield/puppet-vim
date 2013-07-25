# Installs vim-pathogen

# Examples
#
#   include vim
#   vim::pathogen

class vim::pathogen {
  require vim

  file { [$vimdir,
    "${vimdir}/autoload",
    "${vimdir}/bundle"]:
    ensure  => directory,
    recurse => true,
  }

  repository { "${vimdir}/vim-pathogen":
    source => 'tpope/vim-pathogen'
  }

  file { "${vimdir}/autoload/pathogen.vim":
    target  => "${vimdir}/vim-pathogen/autoload/pathogen.vim",
    require => [
      File[$vimdir],
      File["${vimdir}/autoload"],
      File["${vimdir}/bundle"],
      Repository["${vimdir}/vim-pathogen"]
    ]
  }
}
