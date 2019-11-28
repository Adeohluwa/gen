import tables
import strformat
import docopt
import fab


proc genAPI*(args: Table[system.string, docopt.Value]) =
  for name in @(args["<projectname>"]):
    blue(&"Generating API.... {name}")
