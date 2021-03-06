# Package

version       = "1.2.0"
author        = "Adeoluwa Adejumo"
description   = "Ultimate Scaffolding Tool for building GUI/Web/CLI apps in Nim Lang."
license       = "MIT"
srcDir        = "src"
binDir        = "bin"
bin           = @["gen"]



# Dependencies

requires "nim >= 1.0.2", "progress", "docopt", "fab", "gara"

# Tasks

task test, "Run the Test Suite":
  exec "nim c -r tests/tGen.nim"
