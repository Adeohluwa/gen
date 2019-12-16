import os
import strformat
import fab
import docopt
import progress
import commands/[app,api,model,route,controller,license,readme,docker,test,configs]



let doc = """
Gen - Scaffolding tool for GUI/Web/CLI apps.

Usage:
  gen jester:app <project>...
  gen jester:api <api>...
  gen jester:model <model>...
  gen jester:route <route>...
  gen jester:controller <controller>...
  gen jester:test <file>...
  gen nigui:app <project>...
  gen cli:app <project>...
  gen new:license <license>...
  gen new:dockerfile
  gen new:configs
  gen (-h | --help)
  gen (-v | --version)

Options:
  <license>      MIT |  Unilicense | Apache | Mozilla | GnuGPL3
  -h --help      Show this screen.
  -v --version   Show version.
"""



let args = docopt(
doc,
version = """
Gen ©2019 
Version: 0.8.0
Desc: Scaffolding tool for GUI/Web/CLI Apps
Author: Adeoluwa Adejumo
""")



if args["jester:app"]: 
  genApp(args)
  
if args["jester:api"]:
  genAPI(args)

if args["jester:model"]:
  genModel(args)

if args["jester:route"]:
  genRoute(args)

if args["jester:controller"]:
  genController(args)

if args["jester:test"]:
  genTest()

if args["new:dockerfile"]:
  genDocker()

if args["new:license"]:
  genLicense(args)

if args["new:configs"]:
  genConfigs()
