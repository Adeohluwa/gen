import os
import strformat
import fab
import docopt
import progress
import commands/[app,api,model,route,controller,license,readme,docker]



let doc = """
Gen - Scaffolding tool for Jester web framework.

Usage:
  gen new:app <project>...
  gen new:api <api>...
  gen new:model <model>...
  gen new:route <route>...
  gen new:controller <controller>...
  gen new:license <license>...
  gen new:dockerfile
  gen new:readme
  gen (-h | --help)
  gen (-v | --version)

Options:
  <license>      MIT | Apache | GnuGPL3 | PPL
  -h --help      Show this screen.
  -v --version   Show version.
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

if args["new:model"]:
  genModel(args)

if args["new:route"]:
  genRoute(args)

if args["new:controller"]:
  genController(args)

if args["new:dockerfile"]:
  genDocker()

if args["new:license"]:
  genLicense(args)

if args["new:readme"]:
  genReadMe()
