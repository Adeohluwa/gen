import sugar
import tables
import strformat
import strutils
import fab
import docopt


let writeController = (filename: string) => writeFile(
&"{filename}",
"""
import norm/postgres

proc createController(arg: type): type =
  withDb:
    newUser = User(
      name:"sherluck holmes",
      age: "9"
    )
    newUser.insert()
"""
) 

proc genController*(args: Table[system.string, docopt.Value]) =
 
  for filename in @(args["<controller>"]):
    writeController(&"{filename}")
