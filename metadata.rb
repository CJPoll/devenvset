name             'devenvset'
maintainer       'Cody Poll'
maintainer_email 'cjpoll@gmail.com>'
license          'All rights reserved'
description      'Installs/Configures devenvset'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.13'

depends "build-essential"
depends "cmake"
depends "vim_chef", git: "https://github.com/CJPoll/vim_chef.git"
