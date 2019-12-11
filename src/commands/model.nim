import tables
import strformat
import strutils
import fab
import docopt
import run

proc genModel*(args: Table[system.string, docopt.Value]) =
  exec &"cp $(nimble path gen)/templates/models/models.nim models.nim"
