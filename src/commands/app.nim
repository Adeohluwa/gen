import os
import tables
import strformat
import sequtils
import fab
import docopt
import progress

proc genApp*(args: Table[system.string, docopt.Value]) =
  for name in @(args["<project>"]):

    blue(&"Generating folder structure for {name}...")
   
    # Initial files
    let configFiles = @["app.nimble"]
   
    #Nim Files
    let nimFiles = @["app.nm"]

    # MVC folder
    let mvcDir = @["src/models", "src/routes", "src/views"]
    
    # Public directory
    let pubDir = @[ "src/public/img", "src/public/css", "src/public/js"]
 
    # Tests
    let testDir = @[&"tests"]
    let allDirs = mvcDir & pubDir & testDir

    proc run(cmd: string) =
      discard execShellCmd cmd

    # start new progress bar
    var bar = newProgressBar()
    bar.start()
   
    # create directories
    for eachDir in allDirs:
      createDir &"{name}/{eachDir}"
     
    # write config files
    for eachFile in configFiles:
      run &"cp $(nimble path gen)/templates/{eachFile} ./{name}/{eachFile}"
    
    # write nim files
    for eachFile in nimFiles:
      run &"cp $(nimble path gen)/templates/{eachFile} ./{name}/src/app.nim"

    for i in 1..100:  
      sleep(30)
      bar.increment()
    
    bar.finish()
    run &"cd {name} && nimble run app"
