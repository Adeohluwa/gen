import tables
import strformat
import strutils
import fab
import docopt
import run

proc genController*(args: Table[system.string, docopt.Value]) =
  let text = """
  import norm/postgres
  
  proc createController(arg: type): type =
    withDb:
      ... 
  """
  for filename in @(args["<controller>"]):
    writeFile(&"{filename}",text)
