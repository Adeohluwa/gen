import os
import strformat
import sequtils
import fab
import docopt
import progress



let doc = """
Gen.

Usage:
  gen newapp <project>...
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



if args["newapp"]: 
  for name in @(args["<project>"]): 
    blue(&"Generating folder structure for {name}...")
   
    # Initial file
    let files = @[&"{name}/app.nim", 
    &"{name}/app.nimble",
    &"{name}/README.md",
    &"{name}/LICENSE.txt",
    &"{name}/.gitignore",
    &"{name}/Dockerfile",
    &"{name}/.docker-compose.yml"
    ]
   
    # MVC folder
    let mvcDir = @[&"{name}/src/models", &"{name}/src/routes", &"{name}/src/views"]
    
    # Public directory
    let pubDir = @[ &"{name}/src/public/img", &"{name}/src/public/css", &"{name}/src/public/js"]
 
    # Tests
    let testDir = @[&"{name}/tests"]
    let allDirs = mvcDir & pubDir & testDir

    # start new progress bar
    var bar = newProgressBar()
    bar.start()
    
    for i in 1..100:
      for eachDir in allDirs:
        createDir eachDir
      sleep(30)
      bar.increment()
    
    bar.finish()
