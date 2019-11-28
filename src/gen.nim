import os
import strformat
import sequtils
import fab
import docopt
import progress
import commands/[app,api]



let doc = """
Gen.

Usage:
  gen new:app <projectname>...
  gen new:api <projectname>
  gen (-h | --help)
  gen (-v | --version)

Options:
  -h --help        Show this screen.
  -v --version     Show version.
"""



let args = docopt(
doc,
version = """
Gen 
Version: 0.1.0
Desc: Jester boilerplate generator
Author: Adeoluwa Adejumo
© 2019
""")



if args["new:app"]: 
  genApp(args)
  
if args["new:api"]:
  genAPI(args)
