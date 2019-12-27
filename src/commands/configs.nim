import sugar
import tables
import strformat
import strutils
import fab
import docopt



let dotNim = () => writeFile(
"nim.cfg",
"""
--threads:on
-d:release
# opt:speed
"""
)


let dotTravis = () => writeFile(
".travis.yml",
"""
os:
  - linux
dist: trusty

language: c

cache:
  directories:
    - "$HOME/.choosenim"

install:
  - export CHOOSENIM_CHOOSE_VERSION="1.0.4"
  - |
      curl https://nim-lang.org/choosenim/init.sh -sSf > init.sh
      sh init.sh -y
  - export PATH=$HOME/.nimble/bin:$PATH

before_script:
  - set -e
  - set -x

script:
  #library - nimble install -y
  #app - nimble run app

notifications:
  email: false # noisy
"""
)


let dotEnv = () => writeFile(
".env",
"""
DB_HOST=localhost      
POSTGRES_DB=dbname            
POSTGRES_USER=username
POSTGRES_PASSWORD=password
"""
)


let dotGitignore = () => writeFile(
".gitignore",
"""
.env
bin/
src/models/<yourmodel>
"""
)





proc genConfigs*() =
  dotNim()
  dotTravis()
  dotEnv()
  dotGitignore()

