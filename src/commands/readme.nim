import tables
import strformat
import strutils
import fab
import docopt
import run

proc genReadMe*() =
  exec &"cp $(nimble path gen)/templates/readme/README.md ./README.md"
