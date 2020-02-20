import sugar
import tables
import strformat
import strutils
import fab
import docopt
import common



let dotNim = () => writeFile(
"nim.cfg",
"""
--threads:on
-d:release
# opt:speed
"""
)


let dotTravis = (name: string) => writeFile(
".travis.yml",
&"""
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
  #app - nimble run {name}

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
log.txt
bin/
src/models/<yourmodel>
"""
)





proc genConfigs*() =
  let name = getProjectName()
  dotNim()
  dotTravis(name)
  dotEnv()
  dotGitignore()

