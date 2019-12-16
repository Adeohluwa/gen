import os
import tables
import strformat
import sequtils
import fab
import docopt
import progress
import run


proc genApp*(args: Table[system.string, docopt.Value]) =
  for project in @(args["<project>"]):

    blue(&"Generating folder structure for {project}...")
   
    # Initial files
    let configFiles = @["app.nimble"]
    #Nim Files
    let nimFiles = @["app.nm"]
    # MVC folder
    let mvcDir = @["src/models", "src/routes", "src/views", "src/controllers"]
    # Public directory
    let pubDir = @[ "src/public/img", "src/public/css", "src/public/js"]
    # Tests
    let testDir = @[&"tests"]
    let allDirs = mvcDir & pubDir & testDir


    # start new progress bar
    var bar = newProgressBar()
    bar.start()
   
    # create directories
    for eachDir in allDirs:
      createDir &"{project}/{eachDir}"
     
    # write config files
    for eachFile in configFiles:
      exec &"cp $(nimble path gen)/templates/{eachFile} ./{project}/{eachFile}"
      exec &"cp $(nimble path gen)/templates/readme.txt ./README.md"
    
    # write nim files
    for eachFile in nimFiles:
      exec &"cp $(nimble path gen)/templates/{eachFile} ./{project}/src/app.nim"

    for i in 1..100:  
      sleep(30)
      bar.increment()
    
    bar.finish()
    exec &"cd {project} && nimble run app"