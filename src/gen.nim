import os
import strformat
import fab
import docopt
import progress
import commands/[app,api,route,license,readme]



let doc = """
Gen - Scaffolding tool for Jester web framework.

Usage:
  gen new:app <project>...
  gen new:api <api>...
  gen new:route <route>...
  gen new:license <license>...
  gen new:readme
  gen (-h | --help)
  gen (-v | --version)

Options:
  <license>        MIT | Apache | GnuGPL 
  -h --help        Show this screen.
  -v --version     Show version.
"""



let args = docopt(
doc,
version = """
Gen ©2019 
Version: 0.4.0
Desc: Jester boilerplate generator
Author: Adeoluwa Adejumo
""")



if args["new:app"]: 
  genApp(args)
  
if args["new:api"]:
  genAPI(args)

if args["new:route"]:
  genRoute(args)

if args["new:license"]:
  genLicense(args)

if args["new:readme"]:
  genReadMe()
