# Package

version       = "1.0.3"
author        = "Adeoluwa Adejumo"
description   = "Sample Web App"
license       = "MIT"
srcDir        = "src"
binDir        = "bin"
bin           = @["app"]


# Dependencies

requires "nim >= 1.0.2", "jester", "norm >= 1.0.16"

# Tasks

task createdb, "Create DB tables from user defined types":
  exec "nim c -r src/models/models.nim"
  rmFile "src/models/models".toExe()
