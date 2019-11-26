import os
import strformat
import sequtils
import fab
import docopt
import progress



let doc = """
Gen.

Usage:
  gen newapp <projectname>...
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
  for name in @(args["<projectname>"]): 
    blue(&"Generating folder structure for {name}...")
   
    # Initial files
    let files = @["app.nimble", "README.md", "LICENSE.txt"]
   
    # MVC folder
    let mvcDir = @["src/models", "src/routes", "src/views"]
    
    # Public directory
    let pubDir = @[ "src/public/img", "src/public/css", "src/public/js"]
 
    # Tests
    let testDir = @[&"tests"]
    let allDirs = mvcDir & pubDir & testDir

    # start new progress bar
    var bar = newProgressBar()
    bar.start()
    
    for i in 1..100:
      for eachDir in allDirs:
        createDir &"{name}/{eachDir}"
      
      for eachFile in files:
        discard execShellCmd &"cp $(nimble path gen)/templates/{eachFile} ./{name}/{eachFile}"
        discard execShellCmd &"cp $(nimble path gen)/templates/docker/* ./{name}"
        #discard execShellCmd &"cd {name} && nimble install"
      sleep(30)
      bar.increment()
    
    bar.finish()
