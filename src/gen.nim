import os
import strformat
import fab
import docopt
import progress
import commands/[app,api]



let doc = """
Gen.

Usage:
  gen new:app <projectname>...
  gen new:api <apiname>
  gen new:route <routename>
  gen new:license <licensename>
  gen (-h | --help)
  gen (-v | --version)

Options:
  -h --help        Show this screen.
  -v --version     Show version.
"""



let args = docopt(
doc,
version = """
Gen ©2019 
Version: 0.1.0
Desc: Jester boilerplate generator
Author: Adeoluwa Adejumo
""")



if args["new:app"]: 
  genApp(args)
  
if args["new:api"]:
  genAPI(args)
