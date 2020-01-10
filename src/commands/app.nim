import os
import sugar
import tables
import strformat
import sequtils
import fab
import docopt
import progress





# MVC folder
let mvcDir = @["src/models", "src/routes", "src/views", "src/controllers"]
let pubDir = @[ "src/public/img", "src/public/css", "src/public/js"]
let testDir = @[&"tests"]
let allDirs = mvcDir & pubDir & testDir




let nimbleFile = () => writeFile(
"app.nimble",
"""
# Package

version       = "1.0.3"
author        = "Adeoluwa Adejumo"
description   = "Sample Web App"
license       = "MIT"
srcDir        = "src"
binDir        = "bin"
bin           = @["app"]


# Dependencies

requires "nim >= 1.0.2", "jester", "norm >= 1.0.16", "dotenv >= 1.1.1"

# Tasks

task createdb, "Create DB tables from user defined types":
  exec "nim c -r src/models/models.nim"
  rmFile "src/models/models".toExe()
"""
)


let helloWorld = () => writeFile(
"src/app.nim",
"""
import jester

routes:
  get "/":
    resp "Bawo Ni?"

runForever()
"""
)


let readMe = () => writeFile(
"README.md",
"""
# Project Name

<!-- Don't forget to add your badges (License, CI, Code coverage) -->

Project name is a <utility/tool/feature> that allows <insert_target_audience> to do <action/task_it_does>.

<!-- GIF Demo / Screenshot here -->


Additional line of information text about what the project does. Your introduction should be around 2 or 3 sentences. Don't go overboard, people won't read it.

## Features

[x] Feature 1
[x] Feature 2 
[ ] Feature 3

## Installation

Use the package manager [nimble](https://pip.pypa.io/en/stable/) to install foobar.

```bash
nimble install foobar
```

## Usage

```nim
import foobar

foobar.pluralize('word') # returns 'words'
foobar.pluralize('goose') # returns 'geese'
foobar.singularize('phenomena') # returns 'phenomenon'
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## Contact
twitter: @nobody
wechat: xyz

## License
[MIT](https://choosealicense.com/licenses/mit/)
"""
)


proc runApp() = discard execShellCmd "nimble run app > log.txt"


let feedBack = () => echo """
✔️ Created Models folder... 
✔️ Created Views folder... 
✔️ Created Controllers folder...
✔️ Created Routes folder... 
✔️ Created Tests folder... 
✔️ Created .nimble file... 
✔️ Running App......................... 

Framework: Jester
Url: http://0.0.0.0
Port: 5000
Threads: 1
"""







proc genApp*(args: Table[system.string, docopt.Value]) =
  for project in @(args["<project>"]):

    blue(&"Generating folder structure for {project}...")

    # start new progress bar
    var bar = newProgressBar()
    bar.start()
   
    # create directories
    for eachDir in allDirs:
      createDir &"{project}/{eachDir}"
     
    
    for i in 1..100:  
      sleep(30)
      bar.increment()
    bar.finish()
    
    
    setCurrentDir(&"{project}")
    nimbleFile() 
    helloWorld()
    readMe()
    feedBack()
    runApp()
