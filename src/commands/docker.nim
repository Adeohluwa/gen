import tables
import strformat
import strutils
import fab
import docopt
import run

proc genDocker*() =
  exec &"cp $(nimble path gen)/templates/docker/* ."
