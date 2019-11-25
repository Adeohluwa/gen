let doc = """
Gen.

Usage:
  gen new <project>
  gen (-h | --help)
  gen (-v | --version)

Options:
  -h --help     Show this screen.
  -v --version     Show version.
"""

import os
import strutils
import strformat
import docopt
import progress
import fab

let args = docopt(
doc,
version = """
Jester Boilerplate Generator 0.1.0
Copyright 2019
Adeoluwa Adejumo
""")


if args["new"]: 
  for name in @(args["<project>"]): 
    blue("Generating folder structure for your project... $#" % name)
   
    # Initial file
    #copyFile     "templates/app.nim",     &"{name}/app.nim"
    #copyFile    "templates/app.nim",&"{name}/app.nimble"
    #copyFile    "templates/app.nim",&"{name}/README.md"
    #copyFile    "templates/app.nim",&"{name}/LICENSE.txt"
    #copyFile    "templates/app.nim",&"{name}/.gitignore"
    
    # Tests
    createDir  &"{name}/tests"
    
    # MVC folder
    createDir  &"{name}/src/models"
    createDir  &"{name}/src/routes"
    createDir &"{name}/src/views"




    # Public directory
    createDir &"{name}/src/public/img"
    createDir &"{name}/src/public/css"
    createDir &"{name}/src/public/js"
 
    # start new progress bar
    var bar = newProgressBar()
    bar.start()
    

    for i in 1..100:
      sleep(50)
      bar.increment()
    
    bar.finish()
