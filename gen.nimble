# Package

version       = "0.4.0"
author        = "Adeoluwa Adejumo"
description   = "A boilerplate generator for Nim Lang's Jester web framework"
license       = "MIT"
srcDir        = "src"
binDir        = "bin"
bin           = @["gen"]



# Dependencies

requires "nim >= 1.0.2", "progress", "docopt", "fab"

# Tasks

task test, "Run the Test Suite":
  exec "nim c -r tests/tGen.nim"
