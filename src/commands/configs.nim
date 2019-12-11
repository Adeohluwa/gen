import tables
import strformat
import strutils
import fab
import docopt
import run

proc genConfigs*() =
  exec &"cp $(nimble path gen)/templates/configs/nim.cfg nim.cfg"
  exec &"cp $(nimble path gen)/templates/configs/env.txt* .env"
  exec &"cp $(nimble path gen)/templates/configs/travis.txt* .travis.yml"
  exec &"cp $(nimble path gen)/templates/configs/gitignore.txt* .gitignore"
